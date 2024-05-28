Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5201716D9B2
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 15:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716909171; cv=none; b=ZqjbN9sBxc+jN/TX5fn7E8VKFQnWF2W+7hSHSJzbBRfgqD4hEjAOgu65tvPIaFwZhQbjBRfWN8n6RKKM6wLGsMufCLbcErNpcYDZPjPzvrSm3WNa3Rx81t3acFOX9oVjSxgDRSeigZ6kMWgXJosUFsABwWdTANVZjY1zE4KjebI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716909171; c=relaxed/simple;
	bh=Xyomttk9F3ikF4JE0TfA83U8Vxu8y2C829+LlFn+0rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=e/b7TwPgiK7bj+RBGJEkiheAUJUo47T9Ys5kxx4tUghPbCmSckgc5wGN9vYlnUJbeGbjOOHmcWIPnEBBvaM6WRuzWmtZDn1jgxKncRMV0K88S7Nb+Uflc+nipmCS3w01fwTEgH7keMtmP5Kj+4YYietP6Q2uUaoOmJkN5qBMkpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A6D+lmje; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A6D+lmje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716909169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DRbkOsiTA8Mtdxde2HFOZuaWkn5jrKVnmIE5FoEDJN8=;
	b=A6D+lmjeMYDdTL2ysLCzI7YbtNBFKeWfx4WU5+GmJCffoe17igqiJVj0+8q13zsVmhj9/n
	i+RQoaitZ4Zvv6o0TZrx2MI/PR3O7lxhFp09o0pz4iXeSIY0t6u4vAFqcfps+mBj6nnpIP
	rfjG3E2GmkFHzBY3Ai7xpHG/M76hR2I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-gSuHd-LhOZ-tRuw-vRH80A-1; Tue, 28 May 2024 11:12:47 -0400
X-MC-Unique: gSuHd-LhOZ-tRuw-vRH80A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-354f31fbe0bso734808f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 08:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909166; x=1717513966;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRbkOsiTA8Mtdxde2HFOZuaWkn5jrKVnmIE5FoEDJN8=;
        b=AQZkMv5cWfzdoG7z1ziWYut6g0ZFOzKym+O6lVQQ+dEeBy8ElYxgtAPJwU84+fwRxQ
         oc1ExdRrBZZGjFoU7lr9+DwwhsMFAuTQLikpJnd7ANP4heIAyg9+xi/9+YlqkIGuyvPx
         HtZXHZDsNB6FUSABM5WFtAkx4m8hoSAoBD2wQszDn4rb/6vw7UvFTNTji9NKce5v8ELV
         Fgbtl3pSs4D1p0XMaqrAYNzPXd4JFjngsRKxhrBYPrdW8p0HYBsRHDoqITIRffpx+D5a
         7kGPU910uLuFrIk7cmDR2BI2JcJMOM/HelrjMatcifwjN9006Y8X7UCgrSOWXmrNAzg8
         ohlA==
X-Gm-Message-State: AOJu0Yyvgw44gK7IHzA8rgwZOJR3u/DvyV+87Y0nzcvHchStEAWpf5K/
	Ffl7HgBq9NV6X3nIbmvX1B7irkCnAirXPt+X3A1hrwPfXuXGTYKHh9VH9KfBgRTSXoQA4q4/hyl
	PcDCgSsoo23z5Rf58QSZfknmYUDwEYTkBP39uJ+43d2FL5UAbaMj4xCng/BIqfWez
X-Received: by 2002:adf:b1d8:0:b0:351:c615:8165 with SMTP id ffacd0b85a97d-3552fdf226emr8066427f8f.66.1716909166588;
        Tue, 28 May 2024 08:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsYKCEkernsvZitoHhiF8UcTkL8NEqHWmnH892QKFzE43juxLsJwqOpu540t9rq1fN8YWnWw==
X-Received: by 2002:adf:b1d8:0:b0:351:c615:8165 with SMTP id ffacd0b85a97d-3552fdf226emr8066407f8f.66.1716909166140;
        Tue, 28 May 2024 08:12:46 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-109.retail.telecomitalia.it. [79.53.30.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557dcf06c4sm12022864f8f.104.2024.05.28.08.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:12:45 -0700 (PDT)
Date: Tue, 28 May 2024 17:12:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, anton.yakovlev@opensynergy.com
Subject: Re: [PATCH Resend] virtio-snd: improve PCM command lifecycle
 description
Message-ID: <5gcoinwkhq6n6vd5dtpypykp7gy5wzjyyjy4rfpgdeiwes2b23@i6zlcvat7yw7>
References: <Zky6Disx1ofmETmn@fedora>
 <l2f7vf2nzrejy5rk7moymxgsrts3jh5pqcubctbzzmzzsoz4u4@4x63sz5u4ovg>
 <ZlSNR+2ysO9vMXhN@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZlSNR+2ysO9vMXhN@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, May 27, 2024 at 03:40:23PM GMT, Matias Ezequiel Vara Larsen wrote:
>On Thu, May 23, 2024 at 01:00:32PM +0200, Stefano Garzarella wrote:
>> On Tue, May 21, 2024 at 05:13:18PM GMT, Matias Ezequiel Vara Larsen wrote:
>> > The PCM command lifecycle can be described as a state-machine in which
>> > the switching between states is triggered by commands. This commit
>> > explicitly presents the different states and the commands that are
>> > allowed in a given state. This commit leaves to the implementation the
>> > decision the state reached depending on the command.
>> >
>> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> > ---
>> > device-types/sound/description.tex | 26 +++++++++++++++++++-------
>> > 1 file changed, 19 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
>> > index 54c9c8e..55e93af 100644
>> > --- a/device-types/sound/description.tex
>> > +++ b/device-types/sound/description.tex
>> > @@ -397,9 +397,21 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
>> > \item[\field{stream_id}] specifies a PCM stream identifier from 0 to \field{streams} - 1.
>> > \end{description}
>> >
>> > -\paragraph{PCM Command Lifecycle}
>> > +\paragraph{PCM Command Lifecycle State Machine}
>> >
>> > -A PCM stream has the following command lifecycle:
>> > +A PCM stream can be represented by a state-machine made up of the following
>> > +states:
>>
>> I'm not clear about the difference between commands and states. Are they the
>> same?
>>
>
>AFAIU, a command is a request that comes into the control queue, such as
>prepare, set_params, stop, start, etc. State refers to a stream's
>current state.  A command triggers a transition over the stream's
>states. There is a set of valid commands that are allowed in each state.
>The specification does not make such a distinction. I wonder if this was
>done on purpose by the authors.

Okay, so there is a 1:1 overlap between commands and states. Basically, 
the “stop” command has the action of moving the state from the current 
to the “stop” state, right?

>
>> > +\begin{description}
>> > +\item SET PARAMETERS
>> > +\item PREPARE
>> > +\item START
>> > +\item STOP
>> > +\item RELEASE
>> > +\end{description}
>> > +
>> > +A command triggers the transition between these states. To what state to switch
>> > +depends on the implementation. Depending on the state, only certain commands
>> > +are valid. An error may occur if an invalid command is triggered.
>> >
>>
>> Should we explain what the following list is?
>>
>
>I think we should. The list is the states and the commands that are
>valid in a given state. The specification does not explain the state
>that is taken when a command is triggered. I though leaving that for the
>implementation.
>
>> > \begin{enumerate}
>> > \item SET PARAMETERS
>> > @@ -407,13 +419,13 @@ \subsubsection{PCM Control Messages}\label{sec:Device Types / Sound Device / Dev
>> > The driver negotiates the stream parameters (format, transport, etc) with
>> > the device.
>> >
>> > -Possible valid transitions: set parameters, prepare.
>> > +Possible valid commands: set parameters, prepare.
>> >
>
>For example, in the SET_PARAMETERS state, there are two valid commands:
>set parameters and prepare. Any other command in this state would be
>invalid. If the frontend triggers the set_parameters command, the
>backend may decide to either keep the stream state in SET_PARAMETERS or
>switch to PREPARE.
>
>In the spec they use the wording `transition` and I think they mean the
>valid next stream state. I changed this so now the spec specifies the
>valid commands in a given state thus leaving for the implementation the
>transition or the next state.

Okay, perhaps we need to clarify that commands and states are in a 1:1 
relationship and that a command indicates the state to which to move.

Thanks,
Stefano

