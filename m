Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CD33A168B
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881890; cv=none; b=lA7f1lY3QMEP1nqnQlUKlJwQvZ6+0wpPyilbMZkoCQlnnECK+5QfEBiyqUD/mQLU1xNBYaM3GQUGmaBjak0uwxLe/SjmPpHBQz7YYy0busxJMy+GIxoceBnd75F8s8AmavPyw8bpm5YS+YEfCi11dC1FCR/Lh2QE6MJqiHvI45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881890; c=relaxed/simple;
	bh=CO6g6HUchCpIE1jK+G6eTa+gBSD5klOeAK8pozNhM/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cjhPKU8N5n+bU0yWv7LzPm6DF5+LmJpQlJlFbpPG8EMth1KRZkjcRoIQK327mjpo4PZJL5SxmUzLN/tXY/geaAGHHA9w/pL5N5i6GHrVE9BvzKYX2Uo7kO6tX4oF6F2B3CH0SGX6lgNrUKy46x9x6FyRj+zH5Wd+UYCxhr46KN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YW5RSAvK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YW5RSAvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776881888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wNNlR9hdkmuijtqhO8oQO/nMsjTNmUtYgGUHTBjEyZw=;
	b=YW5RSAvKDBiIkEqIHyTaYuJ8tzep1SCYD4YzFvBzAwiBD+d/q1B7rNb1A6QHwG0OH2QcUS
	BmcJKG3P/Ri1KVNXJluclP94Zmin2SCQV/6VpJ+K9QbVxggZab3AHNnPrkcjQiu8ZIBovp
	wOqTbRdppUMx0taXtfGluSJyc6GWs8g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-hcApgbn4P7eQCjJm7rCfpQ-1; Wed, 22 Apr 2026 14:18:06 -0400
X-MC-Unique: hcApgbn4P7eQCjJm7rCfpQ-1
X-Mimecast-MFC-AGG-ID: hcApgbn4P7eQCjJm7rCfpQ_1776881885
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d7d03e1e7so4486368f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 11:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881885; x=1777486685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNNlR9hdkmuijtqhO8oQO/nMsjTNmUtYgGUHTBjEyZw=;
        b=VgRQkpm0r5ww0mupDI/aQR0hf7yeNo5BKTKFwGu17YUm+V0LEcmKqisLtbwBVQW4FK
         1CkjmNzQd38SJKm4Ehcn6FqPqJDHqWXAZ0f/vkxorSfMsNjkatX+CnG1q/0wX3S7fUw/
         HEyAr+iDQZKtGTmQFxD9fkeL0kJObe+3lVWWd1Zlcb9dQhY2efUMxdl9ehA71CHZJ1fo
         06wdP4jSACMMPODXCwlPke71dWCXGf7zY09hcHXpHvaVFfl5NvdRVS86DfDoDDW9G7m6
         8cX9z00fV+pwuCuj1OVtrgNwFG3NqH0z+SFyiruMLSQ52wAzfBt+vkPIXVFPWpolrx7/
         ydcQ==
X-Gm-Message-State: AOJu0YzCJSt3Wfxrgk7vNXtqxVEOHKMTaZFmRI7zlbUgpqlByWMIqgSd
	FcXNbuz0zkmC0xglKCY1eLyD5rp2bntXO7XamIFvhn9RQP4zYUBC7VutXwBCgReNcAoHKZAwGKT
	78YJOhtOqxRBuc7/Nq3dEkHfU7F/Qd0R+pr1DoSUQbqWv2P1eXDfS0c9cJDFWRcxbvKX3
X-Gm-Gg: AeBDietO29DN5UjYjY9m1+0C8A5Oai0sVn5rmkU3RPt4ppRURBss0OqBl1jEAS5xuP8
	N8bA8R/VZaY73NBNW0P5hMyLYcW/vqSzEtKTCH29Ppr3pU9jF2z0Eho7/eD33FEFJVLlt34H77/
	qtt24q3uhp3IBKTf4P8rD3aXEPiekWp1ps9E5rhZT8632Ze3p8HV4+MiqmaRFChJw7kaURYpWkB
	/l7AYIlDrmA5UONc9yj2lw+xpfr6HZcWWgJeGgBqGPpe4dgfcQ+kIiu9tsDqgmeWrulhSy+DmgU
	B59zpoHKHzRZS6d4Mf/kJ59goswCDv0f1BRGHnIBQmpGlRqQOu9B1dCh7CyCq13ivDzeigACkMp
	MANcLRpEuF2E1mtTDKJm2RHF4nPx06GZ7I1lBmQv7sEcaTRAPO5/+ZQ==
X-Received: by 2002:a05:6000:2f8a:b0:43d:7c1b:b8c7 with SMTP id ffacd0b85a97d-43fe3dd210amr38480811f8f.21.1776881885195;
        Wed, 22 Apr 2026 11:18:05 -0700 (PDT)
X-Received: by 2002:a05:6000:2f8a:b0:43d:7c1b:b8c7 with SMTP id ffacd0b85a97d-43fe3dd210amr38480761f8f.21.1776881884572;
        Wed, 22 Apr 2026 11:18:04 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm47009570f8f.13.2026.04.22.11.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:18:03 -0700 (PDT)
Date: Wed, 22 Apr 2026 14:18:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH] content: clarify feature negotiation terminology and
 init sequence
Message-ID: <20260422140834-mutt-send-email-mst@kernel.org>
References: <bf1eadcd07bb7a72c52612f4eb175cd3c3c246d5.1776872324.git.mst@redhat.com>
 <20260422180527.GB498202@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260422180527.GB498202@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z4kXXVSPmQ3jbXYA9S8sl6XBXvtSc5Zt9AYyEBh5654_1776881885
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2026 at 02:05:27PM -0400, Stefan Hajnoczi wrote:
> On Wed, Apr 22, 2026 at 11:38:55AM -0400, Michael S. Tsirkin wrote:
> > Make several clarifications to the init sequence documentation:
> > 
> > The Linux virtio core (drivers/virtio/virtio.c) initializes devices
> > as follows:
> >   1. Intersect driver and device feature bits
> >   2. finalize_features() - write accepted features to the device
> >   3. drv->validate() - read config space, may clear feature bits
> >      (e.g. virtio-net clears VIRTIO_NET_F_MTU if mtu < MIN_MTU,
> >      balloon clears PAGE_POISON if guest does not init pages)
> >   4. If validate changed any features, finalize_features() again
> >   5. virtio_features_ok() - set FEATURES_OK, confirm with device
> > 
> > this allows the device to know which fields will be read:
> > recommend this in the spec.
> > 
> > Legacy driver detection is specified using a mechanism that
> > does not work on all transports. Make it clear that it's an
> > example: what matters is that devices do detection in some way
> > and are compatible with legacy drivers.
> > 
> > Clarify the distinction between features written to the
> > device ("accepted") and features confirmed via FEATURES_OK
> > ("negotiated").
> > 
> > "acknowledged" is used as a synonym for "accepted", but only in two
> > places. Just use "accepted" consistently.
> > 
> > Spec describes multiple moving pieces then ends with "before accepting
> > it" - vague, and is overloading "accept". Replace with a reference to
> > FEATURES_OK.
> > 
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/241
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  content.tex | 31 ++++++++++++++++++++++++-------
> >  1 file changed, 24 insertions(+), 7 deletions(-)
> > 
> > diff --git a/content.tex b/content.tex
> > index 5de811f..3dcba31 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -39,7 +39,7 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
> >  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> >    drive the device.
> >  
> > -\item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
> > +\item[FEATURES_OK (8)] Indicates that the driver has accepted all the
> >    features it understands, and feature negotiation is complete.
> >  
> >  \item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
> > @@ -89,13 +89,21 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> >  
> >  Each virtio device offers all the features it understands.  During
> >  device initialization, the driver reads this and tells the device the
> > -subset that it accepts.  The only way to renegotiate is to reset
> > -the device.
> > +subset that it accepts.  The device validates this subset and
> > +accepts it to complete the negotiation, or rejects it, leaving
> > +the negotiation incomplete. Once the negotiation is complete,
> > +the only way to renegotiate is to reset the device.
> > +
> > +A feature bit is \emph{accepted} once the driver has written it to the
> > +device.
> 
> The above paragraph says the device "accepts" features too. Therefore it
> is confusing to define "accepted" as only require driver action in this
> sentence. Is it implied that the driver's write only completes when the
> device has also accepted the features? I think it would be simpler to
> avoid using the word "accept" in two different steps of the feature bit
> negotiation process.

We don't really need a new verb - we have negotiated for this.


+subset that it accepts.  The device validates this subset and
+either completes the negotiation successfully (the last subset of features
that the driver accepted is consider negotiated then) or fails, leaving
+the feature negotiation incomplete. Once the negotiation is complete,
+the only way to renegotiate is to reset the device.

Hmm?


> > A feature bit is \emph{negotiated} once FEATURES_OK has been
> > +set and confirmed.  Before FEATURES_OK is confirmed, features are
> > +accepted but not yet negotiated, and the device has not confirmed that it
> > +supports the combination selected by the driver.
> >  
> >  This allows for forwards and backwards compatibility: if the device is
> >  enhanced with a new feature bit, older drivers will not write that
> >  feature bit back to the device.  Similarly, if a driver is enhanced with a feature
> > -that the device doesn't support, it see the new feature is not offered.
> > +that the device doesn't support, it will see that the new feature is not offered.
> >  
> >  Feature bits are allocated as follows:
> >  
> > @@ -189,8 +197,8 @@ \subsection{Legacy Interface: A Note on Feature
> >  
> >  Transitional Drivers MUST detect Legacy Devices by detecting that
> >  the feature bit VIRTIO_F_VERSION_1 is not offered.
> > -Transitional devices MUST detect Legacy drivers by detecting that
> > -VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
> > +Transitional devices MUST detect Legacy drivers, e.g. by detecting that
> > +VIRTIO_F_VERSION_1 has not been accepted by the driver.
> >  
> >  In this case device is used through the legacy interface.
> >  
> > @@ -314,6 +322,11 @@ \section{Device Configuration Space}\label{sec:Basic Facilities of a Virtio Devi
> >  greater than the specified 8-bit size.
> >  \end{note}
> >  
> > +\drivernormative{\subsection}{Device Configuration Space}{Basic Facilities of a Virtio Device / Device Configuration Space}
> > +Before reading a device-specific configuration field that is
> > +conditional on a feature bit, the driver SHOULD first accept
> > +that feature bit.
> > +
> >  \devicenormative{\subsection}{Device Configuration Space}{Basic Facilities of a Virtio Device / Device Configuration Space}
> >  The device MUST allow reading of any device-specific configuration
> >  field before FEATURES_OK is set by the driver.  This includes fields which are
> > @@ -530,7 +543,11 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
> >  \item\label{itm:General Initialization And Device Operation /
> >  Device Initialization / Read feature bits} Read device feature bits, and write the subset of feature bits
> >     understood by the OS and driver to the device.  During this step the
> > -   driver MAY read (but MUST NOT write) the device-specific configuration fields to check that it can support the device before accepting it.
> > +   driver MAY read (but MUST NOT write) the device-specific configuration
> > +   fields to check that it can support the device before setting FEATURES_OK.
> > +   The driver SHOULD accept feature bits before reading configuration
> > +   fields conditional on them.  The driver MAY then clear feature bits,
> > +   write the updated subset to the device, and repeat this process.
> 
> The last sentence is a little unclear to me. I think it's saying a
> driver can accept some feature bits, read the configuration space,
> and then change its mind and accept a subset of the previously accepted
> feature bits - all before setting FEATURES_OK.
> 
> The part that confused me was "write the updated subset to the device". Can the "accept" language be used here?
> -> "accept this new subset of feature bits"

Good point, but we need to also tell the device. Let's use just that?

  The driver MAY then accept a different subset of feature bits
  (e.g., deciding, based on the configuration fields, not to use a certain feature),
  tell the device about the updated subset, and repeat this process.


> >  
> >  \item\label{itm:General Initialization And Device Operation / Device Initialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver MUST NOT accept
> >     new feature bits after this step.
> > -- 
> > MST
> > 
> > 


