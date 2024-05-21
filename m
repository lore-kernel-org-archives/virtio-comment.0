Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF884F605
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716291655; cv=none; b=uPMrNPxhd00UZ/65sgaTTsAx+pgqCCjvdklj3gfZhNCUv/E34y5JykdMulmZJNOxZPRF2jeNP0yTHbSyAceeCKN0ex7R7rFEP9kh3i1mnGP7xgO+9YPot1rwOnt5Z/gF7gKFKImOzZC2PcikB06RdkAINoPb4JD7x9z+1lv+YNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716291655; c=relaxed/simple;
	bh=JVShTsQrcf3dEv5/PHUgnNbwbWOybxH/ufMW2HtMKCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hxN2YczEmKj+DzIvsJe5DKmMt3+O5qFdf2y5HbiuANDtAP1f5f6fm2wV5vQZtDHB6TaZ8oEJX4Db25ZyIwMXHDP1Sgbrq2MkMhFTP5EqIdq6YKSg9KLpVlGGdCaZKeAMpf8fCVNT6TR83FSjM7OgwJISNvuSXL405wMOE88dDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Liu7zMpZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Liu7zMpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716291653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+5IjFpDWHhvLVy0I2lxIAH7L5lqewUsfDbwcWnIQrk4=;
	b=Liu7zMpZXUCV6sNncIw35dkt3cIg89co1y0AF2a3DowAAqetgxHxXkxh+hWN6rLWIwoQLv
	DqcKvSm5l+DGIxA0sWR7GQtOeDkP5ubkzB5sj/bMMJLzGPndo596+gO8Zl8o/sAvkgaGId
	5vJOq+syV/I0ugnMjKyqpZiInbOM5oM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-omluSh0wPlOZ6nSwQCIV_w-1; Tue, 21 May 2024 07:40:52 -0400
X-MC-Unique: omluSh0wPlOZ6nSwQCIV_w-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42000e6e9ebso83241105e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 04:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716291651; x=1716896451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5IjFpDWHhvLVy0I2lxIAH7L5lqewUsfDbwcWnIQrk4=;
        b=iVsNrkrHYFdfgnR5cWmgx65vYyIBgn7xjpXmxo7JGKnXBgPSdIyAbXQgLtiteTrQFv
         qDEixYWtABx9a4kRPHpz31Da/Fesyr2Wt65FoohTgGau+4qzuCODLq9So26gFGSNkdSE
         2z+Pew9RMPURnGl3lf9aQzNBuzNofio1OE/UQKAm4pplYThR3yleKC39gmZ3yQqSBxAr
         fy0iQpQca3iYVemfjozLIwJ6YYphmsHoLJYz3moUCWrPr50Rhv/4Z46mYCVyNDQKSPeC
         IV9v4mHmLRXdlQFEMTI3DTj37a98gNecRZ91i++xQ25rzo9wiM2+x9tBUWnzpS67a06d
         8esQ==
X-Gm-Message-State: AOJu0YxNxAMQkGYZ9xfW/s9guLnUHPMJjgJPmxm+xJzcvQWjybTK/M8G
	iuz5vOQjrasPqG2cC21W/3B9vCSvKX8DamocUqFpblS+/F2FeCK651met76mJk5wXwa0BfDzsSA
	irSIYI4gPrvfxKFRQFhkIn0ewgF5iCqmo75CP+zzdM10mFEyc6mtuxnAP5Lf8MbM4
X-Received: by 2002:a05:600c:3508:b0:41b:f116:8868 with SMTP id 5b1f17b1804b1-41feaa38a79mr346992615e9.12.1716291650729;
        Tue, 21 May 2024 04:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhy7QVZTUNBVq8/kNIyIJnVBSipCl5xzk+QFL+yNH1yhe7FPlVHhhNo/h4Om+A2KskuKuxEw==
X-Received: by 2002:a05:600c:3508:b0:41b:f116:8868 with SMTP id 5b1f17b1804b1-41feaa38a79mr346992365e9.12.1716291650199;
        Tue, 21 May 2024 04:40:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5a20:b565:3672:6f2b:3d2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354c58c1768sm5732793f8f.52.2024.05.21.04.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 04:40:49 -0700 (PDT)
Date: Tue, 21 May 2024 07:40:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <20240521073925-mutt-send-email-mst@kernel.org>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <20240520092332-mutt-send-email-mst@kernel.org>
 <20240521105706.tbyigihommrasdua@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240521105706.tbyigihommrasdua@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 04:27:06PM +0530, Viresh Kumar wrote:
> On 20-05-24, 09:27, Michael S. Tsirkin wrote:
> > On Mon, May 20, 2024 at 02:59:40PM +0530, Viresh Kumar wrote:
> > > diff --git a/content.tex b/content.tex
> > > index 0a62dce5f65f..a79993b5ed69 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -631,8 +631,82 @@ \section{Device Cleanup}\label{sec:General Initialization And Device Operation /
> > >  
> > >  \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
> > >  
> > > -Virtio can use various different buses, thus the standard is split
> > > -into virtio general and bus-specific sections.
> 
> > > +Devices and drivers can use different transport methods to enable
> > > +interaction, for example PCI, MMIO, or Channel I/O. The transport
> > > +methods define various aspects of the communication between the device
> > > +and the driver, like device discovery, exchanging capabilities,
> > > +interrupt handling, data transfer, etc. For example, in a host/guest
> > > +architecture, the host might expose a device to the guest on a PCI bus,
> > > +and the guest will use a PCI-specific driver to interact with it.
> > > +
> > > +The standard is split into sections describing general virtio
> > > +implementation and transport-specific sections.
> > > +
> > 
> > This makes it seem like trasport is distinct from both
> > device and driver. Makes no sense to me.
> 
> Yeah, looks wrongly worded. I think we can just retain the earlier
> statement here:
> 
> Virtio can use various different buses, thus the standard is split
> into virtio general and bus-specific sections.
> 
> > > +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> > > +
> > > +The device MUST keep any data associated with a device-initiated
> > > +transaction accessible to the driver until the driver acknowledges the
> > > +transaction to be complete.
> > > +
> > > +The device MUST NOT access the contents of a virtqueue before the
> > > +driver notifies, in a transport defined way, the device that the
> > > +virtqueue is ready to be accessed.
> > > +
> > > +The device MUST NOT access or modify buffers on a virtqueue after it has
> > > +notified the driver about their availability.
> > > +
> > > +The device MUST reset the virtqueues if requested by the driver, in a
> > > +transport defined way, if the transport provides such a method.
> > > +
> > > +\drivernormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
> > > +
> > > +The driver MUST acknowledge device notifications, as mandated by the
> > > +transport.
> > > +
> > > +The driver MUST NOT access virtqueue contents before the device notifies
> > > +about the readiness of the same.
> > > +
> > > +The driver MUST NOT access buffers, after it has added them to the
> > > +virtqueue and notified the device about their availability. The driver
> > > +MAY access them after the device has processed them and notified the
> > > +driver of their availability, in a transport defined way.
> > > +
> > > +The driver MAY ask the device to reset the virtqueues if, for example,
> > > +the driver times out waiting for a notification from the device for a
> > > +previously queued request.
> > >  
> > 
> > This makes no sense in a normative section.
> 
> I am okay with wherever you and Cornelia decide to put this.
> 
> > Normative statements are for implementations not spec writers.
> 
> Hmm.
> 
> > If you think of defining lots of new transports
> > (questionable)
> 
> There is just one in discussion at the moment on the ARM side,
> virtio-msg (for communication between the VMs), but nothing is
> finalized yet.


I feel a non-normative section is enough for this.
Just convert should/must to direct speech.

> > I think a new non-normative section
> > along the lines of newdevice.tex will make sense.
> 
> -- 
> viresh

