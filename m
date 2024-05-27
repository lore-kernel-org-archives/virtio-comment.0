Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5545613A250
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817232; cv=none; b=ubOafU4hSnKO8qXpSqw9Eurc/wfCLpJpduC28XaOQ8rsa3VlvodsBGwAbdpZgAEcNFUaIX5qWMMVm7VVq7IEad/hbpmcWH3siY/RDawGRkuX42Lgd23qSj4oivnPqz337DZGy4++94y3oeoPY7qi+naRAVcQ4BopZFzt/FvXUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817232; c=relaxed/simple;
	bh=loiGzPk0oSYLllK83TObB3Ja1cz7rCw3IowT/bzIzIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qNmU/t8H5C0Fmk7ujmVldM2tQcCLa464tmgDQlisc7WCqwP4lcCAA85+nmuK3tUJRnxM61eyROh0B5/BxSa5xHgXoNDpMHEInudt0/Rh66qjcKzjbrDMflE9fs5MSFQAvYFsE5TvUWEbK/PNyO07teDJasdTLNd5sHT9Pgrnbqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XzzcZEQo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XzzcZEQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716817229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ku8T6CGm70gV4IZVGhK6sewO6MTcl38Qhk/oZebD1s=;
	b=XzzcZEQo0+tU2fbuYIWO8l1o93JMvCXOmNV8Aq3813U0dqjDDPBXp1ONblFUyKOEvDzETn
	c5FmH0Rrx71hUaBN5bSH+VIA9LiKPY2h3wt/4rC9xOXBXQRX6exF96PPbnbaaCdjnqHnXA
	5GXKxgK+SqRlxwnD7dZfSQMUFGnDaAo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-8CJ27RVtPh-nCt4zs_nniw-1; Mon, 27 May 2024 09:40:28 -0400
X-MC-Unique: 8CJ27RVtPh-nCt4zs_nniw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-354fad82058so1627930f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 06:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817226; x=1717422026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ku8T6CGm70gV4IZVGhK6sewO6MTcl38Qhk/oZebD1s=;
        b=xQvpdMPx6pvpZTZmiUxwJynzfyuIpzFb62n1/zujKq5Ns/MJZvCFHFyo+qMYHcUYsp
         IFwxCBfRkxFOlVThQuNaaLVYJDOcuxT2Z1AZsq88ywJtnuP9CfbVrjXx3G8M/Woyjzm9
         jFQW2FTjTFI+kR3cF9pXTsuWsP/jUgCf1XyvqFrJivYWaAZri/vGFoRQgIU4o6xl474W
         65SOOmwEm/pk+uF0Ky+vYiw9xTMEwGAsqj1o/uaiaU4q1UNF3gObcwBJmcCTMcIxPJVg
         8aksoM4slMkIyPeGXaTubY7KHtUP5mlypyKMog5s8sivz58sVpdwMDDvs1mS/W3ryXZk
         KaeA==
X-Gm-Message-State: AOJu0YxALwKhRUO444rQR3uYcfC7zDeQmyoZhsfe5Tk8kfs+y97uXysK
	zl/n3Js8kKN/uSMLyk7bo+mSnfOZCdi+xVTjXIJBC+PY8NK3rFpoqeHcWA7xx6NWmpb6osWyo6H
	SqYmkJiWpOyT7a+eybA5tjVFKFsLlDdEwnABePOlCsNRfBFGaVmENApnZwFhEai5cXuBKUZGZ
X-Received: by 2002:adf:eed2:0:b0:34c:fa17:f4fe with SMTP id ffacd0b85a97d-35526c26ab7mr7492327f8f.21.1716817226672;
        Mon, 27 May 2024 06:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo4ZVL2R2Ba2iT01BC06zutr5IVuXmj62dWYI9ZvcO823xL88j2HSb1NpsFAna5MxCSIg5/A==
X-Received: by 2002:adf:eed2:0:b0:34c:fa17:f4fe with SMTP id ffacd0b85a97d-35526c26ab7mr7492307f8f.21.1716817226154;
        Mon, 27 May 2024 06:40:26 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3582917b222sm4628286f8f.93.2024.05.27.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 06:40:25 -0700 (PDT)
Date: Mon, 27 May 2024 15:40:23 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev, anton.yakovlev@opensynergy.com
Subject: Re: [PATCH Resend] virtio-snd: improve PCM command lifecycle
 description
Message-ID: <ZlSNR+2ysO9vMXhN@fedora>
References: <Zky6Disx1ofmETmn@fedora>
 <l2f7vf2nzrejy5rk7moymxgsrts3jh5pqcubctbzzmzzsoz4u4@4x63sz5u4ovg>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <l2f7vf2nzrejy5rk7moymxgsrts3jh5pqcubctbzzmzzsoz4u4@4x63sz5u4ovg>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 23, 2024 at 01:00:32PM +0200, Stefano Garzarella wrote:
> On Tue, May 21, 2024 at 05:13:18PM GMT, Matias Ezequiel Vara Larsen wrote:
> > The PCM command lifecycle can be described as a state-machine in which
> > the switching between states is triggered by commands. This commit
> > explicitly presents the different states and the commands that are
> > allowed in a given state. This commit leaves to the implementation the
> > decision the state reached depending on the command.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > device-types/sound/description.tex | 26 +++++++++++++++++++-------
> > 1 file changed, 19 insertions(+), 7 deletions(-)
> > 
> > diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> > index 54c9c8e..55e93af 100644
> > --- a/device-types/sound/description.tex
> > +++ b/device-types/sound/description.tex
> > @@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> > \item[\field{stream_id}] specifies a PCM stream identifier from 0 to \field{streams} - 1.
> > \end{description}
> > 
> > -\paragraph{PCM Command Lifecycle}
> > +\paragraph{PCM Command Lifecycle State Machine}
> > 
> > -A PCM stream has the following command lifecycle:
> > +A PCM stream can be represented by a state-machine made up of the following
> > +states:
> 
> I'm not clear about the difference between commands and states. Are they the
> same?
> 

AFAIU, a command is a request that comes into the control queue, such as
prepare, set_params, stop, start, etc. State refers to a stream's
current state.  A command triggers a transition over the stream's
states. There is a set of valid commands that are allowed in each state.
The specification does not make such a distinction. I wonder if this was
done on purpose by the authors.

> > +\begin{description}
> > +\item SET PARAMETERS
> > +\item PREPARE
> > +\item START
> > +\item STOP
> > +\item RELEASE
> > +\end{description}
> > +
> > +A command triggers the transition between these states. To what state to switch
> > +depends on the implementation. Depending on the state, only certain commands
> > +are valid. An error may occur if an invalid command is triggered.
> > 
> 
> Should we explain what the following list is?
> 

I think we should. The list is the states and the commands that are
valid in a given state. The specification does not explain the state
that is taken when a command is triggered. I though leaving that for the
implementation.

> > \begin{enumerate}
> > \item SET PARAMETERS
> > @@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> > The driver negotiates the stream parameters (format, transport, etc) with
> > the device.
> > 
> > -Possible valid transitions: set parameters, prepare.
> > +Possible valid commands: set parameters, prepare.
> > 

For example, in the SET_PARAMETERS state, there are two valid commands:
set parameters and prepare. Any other command in this state would be
invalid. If the frontend triggers the set_parameters command, the
backend may decide to either keep the stream state in SET_PARAMETERS or
switch to PREPARE. 

In the spec they use the wording `transition` and I think they mean the
valid next stream state. I changed this so now the spec specifies the
valid commands in a given state thus leaving for the implementation the
transition or the next state.

Thanks,

> > \item PREPARE
> > 
> > The device prepares the stream (allocates resources, etc).
> > 
> > -Possible valid transitions: set parameters, prepare, start, release.
> > +Possible valid commands: set parameters, prepare, start, release.
> > 
> > \item Output only: the driver transfers data for pre-buffing.
> > 
> > @@ -421,7 +433,7 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> > 
> > The device starts the stream (unmute, putting into running state, etc).
> > 
> > -Possible valid transitions: stop.
> > +Possible valid commands: stop.
> > 
> > \item The driver transfers data to/from the stream.
> > 
> > @@ -429,13 +441,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
> > 
> > The device stops the stream (mute, putting into non-running state, etc).
> > 
> > -Possible valid transitions: start, release.
> > +Possible valid commands: start, release.
> > 
> > \item RELEASE
> > 
> > The device releases the stream (frees resources, etc).
> > 
> > -Possible valid transitions: set parameters, prepare.
> > +Possible valid commands: set parameters, prepare.
> > 
> > \end{enumerate}
> > 
> > -- 
> > 2.41.0
> > 
> > 
> 

