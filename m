Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4680513AD11
	for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719400961; cv=none; b=SWWg2MuSpy5H8wlkDjjpcUJ/uROQdZwH+rrCYKwIP0GdRZY2qdMIVpHytiOnygQC3121fF8FK915gxM2Exodm5BoMF1riUJI7Uw4tGugsnpglnyYB9RXagQlc1DvHcCkrW51Cv7DTcSXFMN9fHWrCcj5qqdgfTD4euOQ9VTWo8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719400961; c=relaxed/simple;
	bh=/uLdrJmaETBxx9Q9/AHiBEnxy0uZ8+JSMyPbMj1pFA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YeMUOQBEMIKoxtIFG3aZZGJc6AFSh4/eMEDwfk3D8j0m4mSayUqq1uMWsmGZOxAwEkqEpBPk0dQt/hMQCPlt27SfCq6liEnSK6/72CTsCc8RmuDisOSefQVZ+oyFtpDvD8kmGf6EfrddcIV1RB35MDOB2uJnLPL4PjFLC0ZUcMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mt09RgjK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mt09RgjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719400958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=08l7xzZSa39OH+pJpqQ0YaSCc3qlk2+uIoSLOJPgjN0=;
	b=Mt09RgjKQh2x7drrr0kF+9asZSPqH8YNqNJeU17KS1JOk364WV8nZ1Pvp/romL3yLztO1h
	lhRIhtdVeRt3V/v1BmiE6ibxFhlUZ9iGnF6M7JnmeEZDZcV0yPSmsHKCs2v9YRlN5AFfr5
	sSr6dyZvDBQ9ZMLS19AWvfYvuEQOkOA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-Qy6iRYl9Nu-BJw6As6cypw-1; Wed, 26 Jun 2024 07:22:36 -0400
X-MC-Unique: Qy6iRYl9Nu-BJw6As6cypw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4246cf4c87dso39677235e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 26 Jun 2024 04:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719400955; x=1720005755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08l7xzZSa39OH+pJpqQ0YaSCc3qlk2+uIoSLOJPgjN0=;
        b=doV/A0nmn33asCvGH4LVdDygWCYG0n3pC67UzZbWpHoInzW/ZR2Pm0RZcIJr0jepDJ
         vVOXkxF9Zj57fIBQayQd4P8P5zx/PPy8djZiqCUeCHbCf1jI/jSQiLBtr09cQBZ9nwM0
         KJHpCNnXSovMMbDUyWBALlXv5WB7gcMH8chiFnlk+vf8MZNYLSRkzTqjbfIFRdJ8pJPX
         mX/xtRi4RRuYI/NZXB+I57pF1AAd9If6lNaTzy+MRAtHrUiDmQ3eqZTLzSvIcGHxMCWY
         QGxpwouWQ1zjVlxpUlPS/bIDepxRfLPMpXXlgFAMuA33KUZFqd4KobQNegvfWmppOAsV
         P8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3LWt1ntqWPRP6tkqOzn5PEGxyYUiAfC4iHmd16r1r5PljKOqGbUC7ajwey7DwXPDVy+fr6zlK7lkQm0Z/uYgOOA9qnEgTGa88YIbgneE=
X-Gm-Message-State: AOJu0YzqJWR5ep3b00EEB3ltlmPoxuhTBDLgen5vrG56WwJ8BGMkzPLW
	GC96T/wbtSdKydfeiUxHthsH8THRZQRCjkTCIlV5wUa1r6CCi38RDdGUWhepINg0nQDnOLARAFU
	6srk4F6kO1xYU4nvAqKYwvHm6oPhduAeOgpGNd/D/7wnbKtsjlQ8qq9FcjtJE3dbR
X-Received: by 2002:a05:600c:16d4:b0:424:a406:ad52 with SMTP id 5b1f17b1804b1-424a406adb7mr26860065e9.19.1719400955423;
        Wed, 26 Jun 2024 04:22:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHUdUH+pO+QZLftcm7h5aGTByw3NaJRKSNTa36GRfWSmvpsZXqJR6Kc9s5R7nD56EQAcugNw==
X-Received: by 2002:a05:600c:16d4:b0:424:a406:ad52 with SMTP id 5b1f17b1804b1-424a406adb7mr26859925e9.19.1719400955029;
        Wed, 26 Jun 2024 04:22:35 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8246b1dsm22846865e9.6.2024.06.26.04.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 04:22:34 -0700 (PDT)
Date: Wed, 26 Jun 2024 13:22:33 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Harald Mommer <harald.mommer@opensynergy.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	virtio-comment@lists.linux.dev,
	Matti Moell <Matti.Moell@opensynergy.com>
Subject: Re: [PATCH] virtio-can: define out of rage can-id
Message-ID: <Znv5+dEBYwgRZ2XE@fedora>
References: <ZkyrnsCXu8mQpDQI@fedora>
 <pf656j5da3lxgo2nn6nvhyz7tutf2rktbwxzddyhenyyvhzxpx@is6fo76auxms>
 <ZnWN3ePT6G6nL3N9@fedora>
 <b527d7c6-285e-4405-843a-6cbad306f8f4@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b527d7c6-285e-4405-843a-6cbad306f8f4@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 26, 2024 at 01:07:17PM +0200, Harald Mommer wrote:
> 
> On 21.06.24 16:27, Matias Ezequiel Vara Larsen wrote:
> > On Wed, Jun 05, 2024 at 10:42:19AM +0200, Stefano Garzarella wrote:
> > > On Tue, May 21, 2024 at 04:11:42PM GMT, Matias Ezequiel Vara Larsen wrote:
> > > > Explain when a message is out of range.
> > > > 
> > > > Signed-off-by: Matias Ezequiel Vara Larsen<mvaralar@redhat.com>
> > > > ---
> > > > * This patch applies on top of virtio-1.4, which has not been released
> > > >   yet.
> > > > ---
> > > > device-types/can/description.tex | 3 +++
> > > > 1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/device-types/can/description.tex b/device-types/can/description.tex
> > > > index 2511d9c..98b163b 100644
> > > > --- a/device-types/can/description.tex
> > > > +++ b/device-types/can/description.tex
> > > > @@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
> > > > invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
> > > > NOT schedule the message for transmission.
> > > > 
> > > > +Note that a message is out of range when a standard frame uses more than 11
> > > > +bits of \field{can_id} or when an extended frame uses more than 29 bits.
> > > > +
> > > 
> Non-extended CAN frame and can_id contains more than 11 bits (not in range
> 0..7FFH) => broken.
> 
> Extended CAN frame and can_id contains more than 29 bits (not in range
> 0..1FFFFFFFH) => broken.
> 
> See also 5.20.3 "Feature bits", there it's mentioned but not this
> prominently.
> 
> Classic CAN frame and sdu length > 8 bytes => broken.
> 
> Comes from ISO 11898-1:2015, should have been mentioned more clearly here as
> it was done in 5.20.3. There is not stated that the allowed value range is
> 0..8. Obvious for CAN people, not obvious for anybody else.
> 
> CAN FD frame and sdu length > 8 bytes and not in the set { 12, 16, 20, 24,
> 32, 48, 64 } bytes => broken.
> 
> Comes from ISO 11898-1:2015, is not obvious for people not too familiar with
> CAN FD and is missing in the virtio CAN specification.
> 
> This is what was meant. Now some good wording is needed.
> 
> 
Thanks Harald! I'll add it in v1.

Matias

