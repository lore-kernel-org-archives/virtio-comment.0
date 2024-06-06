Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6777515FA75
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717672202; cv=none; b=GHPMtdJaa8adWw0E3uVskcgXlYY8O6sDb14cZsAELm0dwXK7AqFuQi2PCOsiFEHHjQmCNhpZOkP6TCigmFeC2w5Dx8jmKpHWujL3PSjM7Ur745zKwn7cqWub5zAYv0atVEYEIrTE+5oJ3ELb134ZeXkNZwlX2BTFeGKe9zlPqLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717672202; c=relaxed/simple;
	bh=sZBAoJqz1YimqavqYPy3NeVbzmM5HEPLWJT8CQbpjgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Q2wkaOSCkQTOFyllZRIWGokxMPkdXqJrs2uCrmpuxEa01erYT/xv/2SVd8e96tLlrqRGnTaJzRZXLwBcTcXZDAFXDK7BSHmm5h3FSYoe4Nk9w6RRbpZw2NP0RafF+bTa+PLLubVQ6KbTQ40xeUB5EWdITuWIlpeHe0eCE+ob0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GmJ9k70N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GmJ9k70N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717672199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MI+XyKi0jhb1jd6SntkFQBHyyBoV9E96U0zZWQJPUiA=;
	b=GmJ9k70NBKuD7oQ5JoXFuphzZrY2UKw57IvFYYDpenJZglcR4JnuQalhWgroLRapLf41Pj
	Ex+VwXsxSiDbeIUxC/YceOjXVGAs4+zNn7yKPgbODqhb/+YL+38bnW8H2jt4Occcy3IWOa
	Me1dPjV4SoV67uMI8IFudyfzHEDi7uk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-rMYdnAxEPK2qXmFkhFpguA-1; Thu, 06 Jun 2024 07:09:55 -0400
X-MC-Unique: rMYdnAxEPK2qXmFkhFpguA-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3d2039ebcc3so633168b6e.2
        for <virtio-comment@lists.linux.dev>; Thu, 06 Jun 2024 04:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717672194; x=1718276994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MI+XyKi0jhb1jd6SntkFQBHyyBoV9E96U0zZWQJPUiA=;
        b=IhjyFjbsED1xJaxuDexAQs+cAHquOs0idukYoVDxCDo1Y/VLqSnWOl4Z7YGl7LLNis
         tfVUkqRytwGg+O12IK6VAQVloNL5VEoUwN+1CViCV+8Qy/vW1DPO+Lkt5UEz9iPF0YPW
         ne5D1MkYMjjpI/DqFjj4fpAe0Jk6/TABuYKSGCw+tWZrkmPRSqgPCvBgKCNjhoeJA34p
         ESDnhqFp2GRflpjWj9yGUdsM8yeeEXF7kXSBNcTA89BmkHxstm9rQ3uu0nLu7vAM1SRt
         ysg9B++utijw2BBaDv4H3W16Sky5jBaZQTX/5fezF+kIivKL9EdqHVYnt4OnhPisVRkQ
         euDg==
X-Gm-Message-State: AOJu0Yx0SppBO7tJa/ydRJNtjB200et4coK80KlvVGk5pQ6y+Zxji43c
	61kXUz3A/5Kf2e0p6pHfIfMfCb2cDtAXEKIYNyJgnVOy7ZcAynYlFvkUoU+ACab9dSDtGNezILr
	klblKF/nY1g+AQmGkaJqHN+lERD8YysMsFBfbvtA6WUk8jpRBPokZ8bSQ7PEzUG47
X-Received: by 2002:a05:6808:2811:b0:3d2:154:b3da with SMTP id 5614622812f47-3d20439df9amr5053507b6e.33.1717672194572;
        Thu, 06 Jun 2024 04:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrsuczDWR0NI2Hf9g2n2PtjesqaRfSMLmcOWXZnTtqTjgGyZM3ZolLT7s6J51QWo/R5U53Bg==
X-Received: by 2002:a05:6808:2811:b0:3d2:154:b3da with SMTP id 5614622812f47-3d20439df9amr5053487b6e.33.1717672194145;
        Thu, 06 Jun 2024 04:09:54 -0700 (PDT)
Received: from fedora (lmontsouris-659-1-55-176.w193-248.abo.wanadoo.fr. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7953281e146sm50191685a.10.2024.06.06.04.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:09:53 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:09:50 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev, anton.yakovlev@opensynergy.com
Subject: Re: [PATCH Resend] virtio-snd: improve PCM command lifecycle
 description
Message-ID: <ZmGY/hH52YBugiXJ@fedora>
References: <Zky6Disx1ofmETmn@fedora>
 <l2f7vf2nzrejy5rk7moymxgsrts3jh5pqcubctbzzmzzsoz4u4@4x63sz5u4ovg>
 <ZlSNR+2ysO9vMXhN@fedora>
 <5gcoinwkhq6n6vd5dtpypykp7gy5wzjyyjy4rfpgdeiwes2b23@i6zlcvat7yw7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5gcoinwkhq6n6vd5dtpypykp7gy5wzjyyjy4rfpgdeiwes2b23@i6zlcvat7yw7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 28, 2024 at 05:12:41PM +0200, Stefano Garzarella wrote:
> On Mon, May 27, 2024 at 03:40:23PM GMT, Matias Ezequiel Vara Larsen wrote:
> > On Thu, May 23, 2024 at 01:00:32PM +0200, Stefano Garzarella wrote:
> > > On Tue, May 21, 2024 at 05:13:18PM GMT, Matias Ezequiel Vara Larsen wrote:
> > > > The PCM command lifecycle can be described as a state-machine in which
> > > > the switching between states is triggered by commands. This commit
> > > > explicitly presents the different states and the commands that are
> > > > allowed in a given state. This commit leaves to the implementation the
> > > > decision the state reached depending on the command.
> > > >
> > > > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > > > ---
> > > > device-types/sound/description.tex | 26 +++++++++++++++++++-------
> > > > 1 file changed, 19 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> > > > index 54c9c8e..55e93af 100644
> > > > --- a/device-types/sound/description.tex
> > > > +++ b/device-types/sound/description.tex
> > > > @@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> > > > \item[\field{stream_id}] specifies a PCM stream identifier from 0 to \field{streams} - 1.
> > > > \end{description}
> > > >
> > > > -\paragraph{PCM Command Lifecycle}
> > > > +\paragraph{PCM Command Lifecycle State Machine}
> > > >
> > > > -A PCM stream has the following command lifecycle:
> > > > +A PCM stream can be represented by a state-machine made up of the following
> > > > +states:
> > > 
> > > I'm not clear about the difference between commands and states. Are they the
> > > same?
> > > 
> > 
> > AFAIU, a command is a request that comes into the control queue, such as
> > prepare, set_params, stop, start, etc. State refers to a stream's
> > current state.  A command triggers a transition over the stream's
> > states. There is a set of valid commands that are allowed in each state.
> > The specification does not make such a distinction. I wonder if this was
> > done on purpose by the authors.
> 
> Okay, so there is a 1:1 overlap between commands and states. Basically, the
> “stop” command has the action of moving the state from the current to the
> “stop” state, right?
> 

Right

> > 
> > > > +\begin{description}
> > > > +\item SET PARAMETERS
> > > > +\item PREPARE
> > > > +\item START
> > > > +\item STOP
> > > > +\item RELEASE
> > > > +\end{description}
> > > > +
> > > > +A command triggers the transition between these states. To what state to switch
> > > > +depends on the implementation. Depending on the state, only certain commands
> > > > +are valid. An error may occur if an invalid command is triggered.
> > > >
> > > 
> > > Should we explain what the following list is?
> > > 
> > 
> > I think we should. The list is the states and the commands that are
> > valid in a given state. The specification does not explain the state
> > that is taken when a command is triggered. I though leaving that for the
> > implementation.
> > 
> > > > \begin{enumerate}
> > > > \item SET PARAMETERS
> > > > @@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> > > > The driver negotiates the stream parameters (format, transport, etc) with
> > > > the device.
> > > >
> > > > -Possible valid transitions: set parameters, prepare.
> > > > +Possible valid commands: set parameters, prepare.
> > > >
> > 
> > For example, in the SET_PARAMETERS state, there are two valid commands:
> > set parameters and prepare. Any other command in this state would be
> > invalid. If the frontend triggers the set_parameters command, the
> > backend may decide to either keep the stream state in SET_PARAMETERS or
> > switch to PREPARE.
> > 
> > In the spec they use the wording `transition` and I think they mean the
> > valid next stream state. I changed this so now the spec specifies the
> > valid commands in a given state thus leaving for the implementation the
> > transition or the next state.
> 
> Okay, perhaps we need to clarify that commands and states are in a 1:1
> relationship and that a command indicates the state to which to move.
> 

Yes, I think that may help to clarify the spec. 
 
When the spec defines the following statement in PREPARE:

"Possible valid transitions: set parameters, prepare, start, release."

This would mean that, if current state is PREPARE and the "set
parameters" command is issued, the transition to the SET PARAMETERS
state would be taken. In my opinion, since the spec talks about a
"possible valid transition", the implementation may decide to either
transit to the SET PARAMETERS state or stay in PREPARE since both where
valid.

Honestly, I do not know if these comments help to clarify the spec.

Matias

