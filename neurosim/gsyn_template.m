function GSYN = gsyn_template(primary_loop_count, folder, suffix, ...
                          time_loop, time_loop_counts, epscBUFFER, synTEMPLATE)
% Function to compute in advance the values for the nicotinic synaptic
%   conductance for a given segmental integration time.  Each template
%   segment is written to a binary file.  The first segment contains a
%   header with information about the parameters used to compute the
%   template.  The header consists of 12 values each saved in IEEE
%   floating point (single, 4 bytes) with big-endian byte ordering: the
%   temporal resolution of the template (saveSTEP), the threshold
%   synaptic condtuctance (thresholdGSYN), the maximum synaptic
%   conductance for the primaries and secondaries (gsynBAR(1:2)), the
%   initial settling time before firing (pulseSTART), the final
%   settling time after firing (pulseEND), the amplitude of the
%   presynaptic frequency modulation (f_oscAMPLITUDE(1)), the rate of
%   the presynaptic frequency modulation (f_oscRATE), the phase of the
%   presynaptic frequency modulation for primaries and secondaries
%   (gvars.f_oscPHASE(1:2)), the number of secondary synapses
%   (numSECONDARIES), the calculated mean presynaptic firing frequency
%   for the current template, and the full temporal length of the
%   template (integTIMES).
%
% by Diek W. Wheeler, Ph.D.

% Last change 02/01/02 
% 06/27/02 added pulseEND as a parameter to be written out to the header
% 07/02/02 was not properly accomodating the addition of the final settling
%          time in terms of the length of the template - added 3 cases which
%	   depend on the relative lengths of the final settling time to a
%	   single synaptic event template
% 07/19/02 removed pulseEND from being written to template header and added
%          back in a sixth junk variable
% 08/12/02 added afterDELAY to template header
% 08/15/02 increased template header size to 512-bytes, or 128 single floats
% 08/19/02 replaced all global variables with 'gvars.' structure
% 08/21/02 removed epscBUFFER and synTEMPLATE from the gvars structure so they
%	   are now passed through the function call
%	   added lenTEMPLATE to the gvars structure
% 09/16/02 modified code to account for condition when there are no
%          pulses generated for the template for one of the synapses
% 10/01/02 added variable headerSIZE to the formation of the
%          template header
% 05/15/03 started to add facilitaton
% 05/16/03 finished adding facilitation
% 10/31/03 removed suffix from gtm filename

global gvars                       % Definitions are located in global_defs.m

% Set up local variables for code readability

xFactor = gvars.facilitationFactor;
decayRate = gvars.facilitationDecayRateMsec;

  if (gvars.templateFLAG == 1) % menu options

    len_buffer = length(epscBUFFER);       % Assign variable so don't have to
				           % keep calling the function length()
    len_template = gvars.lenTEMPLATE - 1;
			   % Length of template not counting the starting point
    len_final = gvars.pulseEND / gvars.saveSTEP;    

    if (len_template > len_final)
      len_end = len_template - len_final;
    elseif (len_final > len_template)
      len_end = len_final - len_template;
    else
      len_end = len_template;
    end

    %len_gsyn = gvars.numPOINTS+len_template;  % if the last synaptic event starts at
    len_gsyn = gvars.numPOINTS+len_end; % if the last synaptic event starts at
				        %   at the final point in the
				        %   gvars.numPOINTS array, then the
				        %   full length of the synaptic
				        %   template must accomodate the
                                        %   overflow
    clear GSYN;
    GSYN = zeros(len_gsyn,2);  % allocate time and conductance arrays for the
			       %   synaptic template
    %GSYN(:,1) = [gvars.startTIME:gvars.saveSTEP:...
    %                  gvars.integrationTIME+((len_template)*gvars.saveSTEP)]';
    GSYN(:,1) = [gvars.startTIME:gvars.saveSTEP:...
                            gvars.integrationTIME+((len_end)*gvars.saveSTEP)]';
                                   % establish time array for synaptic template
    GSYN(1:len_buffer,2) = GSYN(1:len_buffer,2) + epscBUFFER;
    epscBUFFER = 0;
    for n = 1:gvars.numSYN
      index2 = len_gsyn;
      if (gvars.pulseCOUNTER(n) > 0)
	for i = gvars.pulse_loopSTART(n):gvars.pulseCOUNTER(n)
	  index1 = round((gvars.pulseTIMES(i,n)-gvars.startTIME)/gvars.saveSTEP);
	  if (index1 > 0)
% gvars.numPOINTS is the number of points in the current integration
% time segment, and if the end of the segment is reached then
% gvars.pulse_loopSTART is updated to the current value of i in the
% i-loop so that the proper pulse number will be started on during the
% next integration time segment.
            if (index1 > gvars.numPOINTS)
	      gvars.pulse_loopSTART(n) = i;
	      break; % Break out of i loop.
	    end
	    %index2 = index1 + len_template;
	    index2 = index1 + len_end;
	    if (index2 > len_gsyn)
	      index2 = len_gsyn;
	    end
	    index_delta = index2 - index1 + 1;
	    
	    facilitation = 1;
	    if (gvars.isFacilitationActive)
		for iFactor = (i-1):-1:1
		    deltaT = gvars.pulseTIMES(i,n)-gvars.pulseTIMES(iFactor,n);
		    facilitation = facilitation + ...
			(xFactor*exp(-deltaT/decayRate));
		end
	    end
	    scaledTemplate = facilitation*synTEMPLATE;

            GSYN(index1:index2,2) = GSYN(index1:index2,2) + ...
	                        gvars.gsynBAR(n)*scaledTemplate(1:index_delta);
	  end % if (index1 > 0)
	end % i loop
      end % if (gvars.pulseCOUNTER(n) > 0)
      epscBUFFER = GSYN(gvars.numPOINTS:index2,2);
    end % n loop

    if (time_loop == time_loop_counts)
      ;%GSYN(len_gsyn-(gvars.pulseEND/gvars.saveSTEP+len_template)+1:len_gsyn,2) = 0;
    end

  else % binary file

    GSYN = zeros(gvars.numPOINTS,2);  % allocate time and conductance arrays
			              %   for the synaptic template
    GSYN(:,1) = [gvars.startTIME:gvars.saveSTEP:...
                                      gvars.integrationTIME+gvars.saveSTEP/2]';
                                   % establish time array for synaptic template
    GSYN(:,1) = round(GSYN(:,1)*10000);  % Clean up values
    GSYN(:,1) = GSYN(:,1)/10000;         %  in two step process

    template_fid = fopen(gvars.templateFILE, 'r', 'b');
    fseek(template_fid, gvars.gsyn_fileMARK, -1);
    GSYN(:,2) = fread(template_fid, gvars.numPOINTS, 'single');
    gvars.gsyn_fileMARK = ftell(template_fid);
    status = fclose(template_fid);

  end % if (gvars.templateFLAG == 1)

% Write template data to file.
  gsyn_file = sprintf('%s/gsyn.gtm', folder);
  if (time_loop == 1)
    gsyn_fid = fopen(gsyn_file, 'w', 'ieee-be');
    fwrite(gsyn_fid, GSYN(2,1), 'single');                     % time step size
    fwrite(gsyn_fid, gvars.thresholdGSYN, 'single');
                                               % threshold synaptic conductance
    fwrite(gsyn_fid, gvars.gsynBAR(1), 'single');% primary synaptic conductance
    fwrite(gsyn_fid, gvars.gsynBAR(2), 'single');
				               % secondary synaptic conductance
    fwrite(gsyn_fid, gvars.pulseSTART, 'single');       % initial settling time
    fwrite(gsyn_fid, gvars.f_oscAMPLITUDE(1), 'single');% amplitude of fpre mod
    fwrite(gsyn_fid, gvars.f_oscRATE, 'single');      % rate of fpre modulation
    fwrite(gsyn_fid, gvars.f_oscPHASE(1:2), 'single');
					            % phases of fpre modulation
    fwrite(gsyn_fid, gvars.numSECONDARIES, 'single');   % number of secondaries
    if (gvars.templateFLAG == 1) % from menu options
      f_pre = gvars.pulseCOUNTER(1) * ...
                                 (1000 / gvars.integTIMES(primary_loop_count));
      fwrite(gsyn_fid, f_pre, 'single');            % synaptic firing frequency
    else % gvars.templateFLAG == 2  from binary file
      fwrite(gsyn_fid, gvars.primaryFREQS(1), 'single');
					            % synaptic firing frequency
    end
    fwrite(gsyn_fid, gvars.integTIMES(primary_loop_count), 'single');
							     % integration time
    fwrite(gsyn_fid, gvars.baseTIME, 'single');      % integration segment size

    fwrite(gsyn_fid, gvars.afterDELAY, 'single');
                                                         % after-template delay
    fwrite(gsyn_fid, zeros((gvars.headerSIZE-14),1), 'single');
                                                   % junk to fill 512-byte
                                                   % (128 single floats) header
  else
    % Do nothing to gsyn_file.  Do not write out header to segments > 1.
    gsyn_fid = fopen(gsyn_file, 'a', 'ieee-be');
  end

  fwrite(gsyn_fid, full(GSYN(1:gvars.numPOINTS,2)), 'single');
  status = fclose(gsyn_fid);

