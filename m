Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9543C5DBE
	for <virtio-comment@lists.linux.dev>; Fri, 24 Apr 2026 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033030; cv=none; b=nKjpZputOzmtOVEXY+UH2CvE2fRFzQoyFhtsX8v1YAZiKFiFWloeE6/4FvhYcULz80HuMLd8rvp7bfarhfGynWN5u93BgFXV8ZxVLuS/1DRfqUGybPn0tKeZ5EAkbGEOiWEtEcp1qKS6nLmfET3qo2VKadkda/uQ0uGQ3BQDwy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033030; c=relaxed/simple;
	bh=EKQKJIWA19Z8ZrgHka5moFjXRiEkFY8gBYhNjxPuoC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pv2CR9Fhdr0q1YFrzl8mQQFRfvXqaUAgYQysoOsepLNS9WgEFVGjaLk3ktT0vr5Jhu4IPY2ptHoOvSLpzyIvtlW+Qq2pWi10l/snNoJBCxWuc7M/UtOmCLh0Cs/iEf4/iSelLZgvJvNEEybTVjS22gJt1CADkBsfuN38Hohbgxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UfrIBCLu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UfrIBCLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777033026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Z944E2QmgQLxm7IaHAr+JJl00gxWM6NUbFf8MBSA+0=;
	b=UfrIBCLujxG+m9TJeTi6uoeX7QjPrU5v+fhKFA2LJezH6E3MXjd+UTqymoIUqgGA6Wt94v
	YUeEOE52eJPxdVb1A6zDVB8yicK0F+O2wElxd17uTxrbfO5vo6Nf8PqiWC0Io1COMiojxR
	+oDCv/iSv/n4163kNwyB5v/U5OdJR5I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-2AJ2MTJdNjymj0MqkszvpA-1; Fri, 24 Apr 2026 08:17:04 -0400
X-MC-Unique: 2AJ2MTJdNjymj0MqkszvpA-1
X-Mimecast-MFC-AGG-ID: 2AJ2MTJdNjymj0MqkszvpA_1777033023
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48a5adc141cso19691675e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 24 Apr 2026 05:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033023; x=1777637823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Z944E2QmgQLxm7IaHAr+JJl00gxWM6NUbFf8MBSA+0=;
        b=XuynWQ+e3oA+VvzfmNohH5JQIo1DwinGfsgrJll1ZUiZme0Y9cTOJCvUO9hfUYRbfO
         r+LB1fskOyuoCepByk/TIC7QNp4OKaov2NpVthX50nKGGSJc+gqQeqMVDoCpcEqWEuRM
         ZuuBRzwF2OsXeNxHREXtL75pSeO5p9UhfWYROb9/FzdhcdOT9OeV5BnAaTvOBMCZo4zC
         3GthoNrqMmkmTIugfHaInrewBDZ5Y0N/YiVX2O76jIG8BG6VW+xjzvxUjjrV0t6JLx6F
         YliAUvWTZrk/7u0S+Y1ixgZ4KS16WK3ShTnzaZlL8ygYcUT4XWWLPSJ+3dPmD/3W2qOJ
         fuQA==
X-Gm-Message-State: AOJu0Yy/FluE+Ajbgq1jguIISgRvuYJ6W3YPAIxQmRKXP/Mce95DOlp8
	XW6eBAOFAgaYzdnZZWC/m1dlw+pqCZpkWsO1qNKnfBq23aDB7z9StjOVBhKZHRShX052jOMS4Qn
	YI+PtO8FAo7OWmtW+wOxScE2MVyHPh5/c3FQ6FeAZ/nH0y0VBcoKhqOmR84Jn9SyBEaw/
X-Gm-Gg: AeBDies6UZkWOGKeg9w6QPEp+wlmvJP477iCxXMcaXLL+9zKt5aiy6+mmEesS7pCMDZ
	xrDUNJMFrO+7PhrMfk671cn2EtgsmKHF5SLDN5pbTT3lFZjgvt71iJqT+W6DrjbG6Y6llQLF6MJ
	8jIIX7zMwCjYSVXnhW6QlIHlYLShhdfvSD4dTE+dtt/fzWjCPY6OZzIU47LUM212ghrYDE8wlbT
	ZzckoYlDYaSlCP0+JGTWKTwiI80FJ3hHfU0kSRgPyA/EtN3LK7RkaiRA0WJkHXxJ1FzTPpLfDTA
	r0uQbo+yOERoW67+zbAF+g/bPKajn0q49Dz5aF99OXg5kiypcl7NxCPKZdm7pxt//OGJplOkLcG
	loO70QFMk0qeHxAHVpCQ+KhK+C82s5wU0X6NfjGPy22SROatpKlV3UA==
X-Received: by 2002:a05:600c:a305:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a53cb8949mr187712005e9.14.1777033023026;
        Fri, 24 Apr 2026 05:17:03 -0700 (PDT)
X-Received: by 2002:a05:600c:a305:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a53cb8949mr187711585e9.14.1777033022290;
        Fri, 24 Apr 2026 05:17:02 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm533978625e9.8.2026.04.24.05.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 05:17:01 -0700 (PDT)
Date: Fri, 24 Apr 2026 08:16:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, stefanha@redhat.com
Subject: Re: [PATCH v2] content: clarify feature negotiation terminology and
 init sequence
Message-ID: <20260424081430-mutt-send-email-mst@kernel.org>
References: <05b081b9c5a3a904fda3e378ca3e91a2c9375c27.1776982968.git.mst@redhat.com>
 <CADSE00KenZKrMuL3tCuGBNP8cYvEvD5J_v0Qt44Pzx+WxhLnPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00KenZKrMuL3tCuGBNP8cYvEvD5J_v0Qt44Pzx+WxhLnPA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NhBYoXuRbVV9uQOIMbVaNmD7aSB-vxDzIey1qmRL0w0_1777033023
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Apr 24, 2026 at 02:05:46PM +0200, Albert Esteve wrote:
> On Fri, Apr 24, 2026 at 12:34 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
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
> > Define "negotiated" for features confirmed via FEATURES_OK.
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
> >
> > changes:
> > address review comments by Stefan
> >
> >  content.tex | 28 +++++++++++++++++++++-------
> >  1 file changed, 21 insertions(+), 7 deletions(-)
> >
> > diff --git a/content.tex b/content.tex
> > index 5de811f..0f4d662 100644
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
> > @@ -89,13 +89,16 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> >
> >  Each virtio device offers all the features it understands.  During
> >  device initialization, the driver reads this and tells the device the
> > -subset that it accepts.  The only way to renegotiate is to reset
> > -the device.
> > +subset that it accepts.  The device validates this subset and
> > +either completes the negotiation successfully (the last subset of features
> > +that the driver accepted is considered negotiated then) or fails,
> > +leaving the feature negotiation incomplete. Once the negotiation is
> > +complete, the only way to renegotiate is to reset the device.
> >
> >  This allows for forwards and backwards compatibility: if the device is
> >  enhanced with a new feature bit, older drivers will not write that
> >  feature bit back to the device.  Similarly, if a driver is enhanced with a feature
> > -that the device doesn't support, it see the new feature is not offered.
> > +that the device doesn't support, it will see that the new feature is not offered.
> >
> >  Feature bits are allocated as follows:
> >
> > @@ -189,8 +192,8 @@ \subsection{Legacy Interface: A Note on Feature
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
> > @@ -314,6 +317,11 @@ \section{Device Configuration Space}\label{sec:Basic Facilities of a Virtio Devi
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
> > @@ -530,7 +538,13 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
> >  \item\label{itm:General Initialization And Device Operation /
> >  Device Initialization / Read feature bits} Read device feature bits, and write the subset of feature bits
> >     understood by the OS and driver to the device.  During this step the
> > -   driver MAY read (but MUST NOT write) the device-specific configuration fields to check that it can support the device before accepting it.
> > +   driver MAY read (but MUST NOT write) the device-specific configuration
> > +   fields to check that it can support the device before setting FEATURES_OK.
> > +   The driver SHOULD accept feature bits before reading configuration
> 
> As I understand it, this should be SHALL (mandatory requirement) -- or
> MUST, not SHOULD (which reads as a recommendation). Otherwise it would
> violate the spec, and probably cause a hard BUG() panic in the kernel
> if the driver queries a feature it never declared in its
> feature_table, or result in silent data corruption if it bypasses
> feature checks entirely and reads conditional config fields directly.


Unfortunately, we never required this in the past.

So we can recommend but we can not make it a MUST now. Devices have to
cope with existing drivers.



> > +   fields conditional on them.  The driver MAY then accept a different
> > +   subset of feature bits (e.g., deciding, based on the configuration
> > +   fields, not to use a certain feature), tell the device about the
> > +   updated subset, and repeat this process.
> >
> >  \item\label{itm:General Initialization And Device Operation / Device Initialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver MUST NOT accept
> >     new feature bits after this step.
> > --
> > MST
> >
> >

