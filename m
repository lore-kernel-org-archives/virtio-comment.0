Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7F336F414
	for <virtio-comment@lists.linux.dev>; Fri, 24 Apr 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032362; cv=none; b=uMB7r/0yeKLUG/2WpCwn9MQ9liXyJ6aa658NrCrZW9+68Uc0UNr1/EgfCWZ0RPP7c2p3B7kZanWDiMocZ0AbYrIA3pz6dDnIYybJKRHm929rzHs/QVO40d2m0QQg6utNR0FfJTSIr1yg7mv4IUHlZ2SQmuS82UtmNqkj3f40O0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032362; c=relaxed/simple;
	bh=a5YLavWN6nmAv7hzhDWDy5eXtjC+yxv0aw3Bo1Lnhoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8SQz3IpfPbcar4OIoyKDQk0nvo3AEh2y4AMQdndHgnO8iBfmScuKzqk7yxw6rTPrZY8aLNKFFqyDrGNipEapyhDSHedfMZ0YTf89hIcmzaKM6QaODo/o7BuNFm0QeU+VyKBTjlmcjj2nUFvZhC7V2Jo9weEkobOoYmIyQkYGcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7nQWEQo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7nQWEQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777032360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swsjG//mAlCpfZ9atoGQUF6aeSyMsPydbTPKhPEKrtY=;
	b=D7nQWEQoB2vk2c7qTknLSLqvEW0c+TAGcA2z/Vm8FEh5mzJX3Ffc0JniHmS0VZztdgWiZB
	coffOQBUYBm/O1zhxRRPL7kpsXyXaZvCBgt9jGSaP5D8d58BosA3BInLLsuUetGsxN9M0R
	pG8NHBLKO1JzTbAm1oggXM7MVAHBAQo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-dWiP2sbrNOmLR4_mFxVSAg-1; Fri, 24 Apr 2026 08:05:59 -0400
X-MC-Unique: dWiP2sbrNOmLR4_mFxVSAg-1
X-Mimecast-MFC-AGG-ID: dWiP2sbrNOmLR4_mFxVSAg_1777032358
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-79a670a5fe9so188297507b3.1
        for <virtio-comment@lists.linux.dev>; Fri, 24 Apr 2026 05:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032358; x=1777637158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=swsjG//mAlCpfZ9atoGQUF6aeSyMsPydbTPKhPEKrtY=;
        b=bSq/gTL4mKBBNSp/N22KpI0GV/ooC8QmJEZowcHAJo3TfD35nOrrV3i3f9nzAelb9F
         dVVfEkL7d9OLNN7lYgSlaqr0XXt8Y9a9yUnt5Ku0iBYc1EGeO7yyt1ie/Kg20Oeh8cyz
         VZUCj9gN0NpkqVfj3TctbOuQe38xa5cQXApcBzvt2Qck76tVIbiC1MeZWahFoIu0P1OF
         kDE/ocptKl/yXBTDX5DzcMdUWqP/KXqNTzuX9TGotGcrsDmckFLFyuHxk66wlSdSLIzn
         nrn5cEK9kxzNKCPj31rtlkMGi/lKcJGJmb9F1TYynsP0Y4Qnq4uO+4HX4s7BRInN21lU
         Y6Mw==
X-Gm-Message-State: AOJu0YyiHZGx4OLtn+5CCqaDSONcMRiLOAnL60BOAjpfiH6I8f28z8An
	yIp/ItdcE0OaJUL95+hC/O+rVbkOD9+G32uygYIRGuxE3bm+AGVeMm9A1pcys611lDC9ivMacSp
	S2pmZ7dnVkA1I5ynye3fdj6YLoP5v1ZLyGeKtPlRiaY0daUs+cJVmo9eEejhZp1/G3zPJxtWQa+
	qS5EC+zp7yoGh5J2kSC25tsgdxLJauZZhYSyCWrbZtIIA=
X-Gm-Gg: AeBDieuGxLHy6yzqXtYRYBfO8OtiS2RQEGdXq20EXY5i9bFQgMTMTHLO0EoZdi+6Ko2
	gq16veHRdDl88b7mo6y/fCyHDJo43V9FUsbBfGwjLUkbAdAfx8/OfY+Mu2PfYrJCcDJd1MFU4aB
	8xaXCsz/ClfyWja8Z43xq36jo141nbEktmKGjJ/9jHEK71IPLlzHrfejY1Sm6xZP+DXo2+jH7aO
	fdYdAG2djzOjn3N
X-Received: by 2002:a05:690c:8e10:b0:7b7:de6:3354 with SMTP id 00721157ae682-7b9ecfccc38mr265186727b3.37.1777032358146;
        Fri, 24 Apr 2026 05:05:58 -0700 (PDT)
X-Received: by 2002:a05:690c:8e10:b0:7b7:de6:3354 with SMTP id
 00721157ae682-7b9ecfccc38mr265186337b3.37.1777032357686; Fri, 24 Apr 2026
 05:05:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <05b081b9c5a3a904fda3e378ca3e91a2c9375c27.1776982968.git.mst@redhat.com>
In-Reply-To: <05b081b9c5a3a904fda3e378ca3e91a2c9375c27.1776982968.git.mst@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 14:05:46 +0200
X-Gm-Features: AQROBzAJZ8jQzHN0ZpvuSBKHriQirMs0M0ycOCNZ3MJcqunN51W_XCr-lXSgKo0
Message-ID: <CADSE00KenZKrMuL3tCuGBNP8cYvEvD5J_v0Qt44Pzx+WxhLnPA@mail.gmail.com>
Subject: Re: [PATCH v2] content: clarify feature negotiation terminology and
 init sequence
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _g2NNrMLrn94uXrATK-y05RIFy9Uk6Y9is-4uDz2LOU_1777032358
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 12:34=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> Make several clarifications to the init sequence documentation:
>
> The Linux virtio core (drivers/virtio/virtio.c) initializes devices
> as follows:
>   1. Intersect driver and device feature bits
>   2. finalize_features() - write accepted features to the device
>   3. drv->validate() - read config space, may clear feature bits
>      (e.g. virtio-net clears VIRTIO_NET_F_MTU if mtu < MIN_MTU,
>      balloon clears PAGE_POISON if guest does not init pages)
>   4. If validate changed any features, finalize_features() again
>   5. virtio_features_ok() - set FEATURES_OK, confirm with device
>
> this allows the device to know which fields will be read:
> recommend this in the spec.
>
> Legacy driver detection is specified using a mechanism that
> does not work on all transports. Make it clear that it's an
> example: what matters is that devices do detection in some way
> and are compatible with legacy drivers.
>
> Define "negotiated" for features confirmed via FEATURES_OK.
>
> "acknowledged" is used as a synonym for "accepted", but only in two
> places. Just use "accepted" consistently.
>
> Spec describes multiple moving pieces then ends with "before accepting
> it" - vague, and is overloading "accept". Replace with a reference to
> FEATURES_OK.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/241
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>
> changes:
> address review comments by Stefan
>
>  content.tex | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index 5de811f..0f4d662 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -39,7 +39,7 @@ \section{\field{Device Status} Field}\label{sec:Basic F=
acilities of a Virtio Dev
>  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>    drive the device.
>
> -\item[FEATURES_OK (8)] Indicates that the driver has acknowledged all th=
e
> +\item[FEATURES_OK (8)] Indicates that the driver has accepted all the
>    features it understands, and feature negotiation is complete.
>
>  \item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that =
the
> @@ -89,13 +89,16 @@ \section{Feature Bits}\label{sec:Basic Facilities of =
a Virtio Device / Feature B
>
>  Each virtio device offers all the features it understands.  During
>  device initialization, the driver reads this and tells the device the
> -subset that it accepts.  The only way to renegotiate is to reset
> -the device.
> +subset that it accepts.  The device validates this subset and
> +either completes the negotiation successfully (the last subset of featur=
es
> +that the driver accepted is considered negotiated then) or fails,
> +leaving the feature negotiation incomplete. Once the negotiation is
> +complete, the only way to renegotiate is to reset the device.
>
>  This allows for forwards and backwards compatibility: if the device is
>  enhanced with a new feature bit, older drivers will not write that
>  feature bit back to the device.  Similarly, if a driver is enhanced with=
 a feature
> -that the device doesn't support, it see the new feature is not offered.
> +that the device doesn't support, it will see that the new feature is not=
 offered.
>
>  Feature bits are allocated as follows:
>
> @@ -189,8 +192,8 @@ \subsection{Legacy Interface: A Note on Feature
>
>  Transitional Drivers MUST detect Legacy Devices by detecting that
>  the feature bit VIRTIO_F_VERSION_1 is not offered.
> -Transitional devices MUST detect Legacy drivers by detecting that
> -VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
> +Transitional devices MUST detect Legacy drivers, e.g. by detecting that
> +VIRTIO_F_VERSION_1 has not been accepted by the driver.
>
>  In this case device is used through the legacy interface.
>
> @@ -314,6 +317,11 @@ \section{Device Configuration Space}\label{sec:Basic=
 Facilities of a Virtio Devi
>  greater than the specified 8-bit size.
>  \end{note}
>
> +\drivernormative{\subsection}{Device Configuration Space}{Basic Faciliti=
es of a Virtio Device / Device Configuration Space}
> +Before reading a device-specific configuration field that is
> +conditional on a feature bit, the driver SHOULD first accept
> +that feature bit.
> +
>  \devicenormative{\subsection}{Device Configuration Space}{Basic Faciliti=
es of a Virtio Device / Device Configuration Space}
>  The device MUST allow reading of any device-specific configuration
>  field before FEATURES_OK is set by the driver.  This includes fields whi=
ch are
> @@ -530,7 +538,13 @@ \section{Device Initialization}\label{sec:General In=
itialization And Device Oper
>  \item\label{itm:General Initialization And Device Operation /
>  Device Initialization / Read feature bits} Read device feature bits, and=
 write the subset of feature bits
>     understood by the OS and driver to the device.  During this step the
> -   driver MAY read (but MUST NOT write) the device-specific configuratio=
n fields to check that it can support the device before accepting it.
> +   driver MAY read (but MUST NOT write) the device-specific configuratio=
n
> +   fields to check that it can support the device before setting FEATURE=
S_OK.
> +   The driver SHOULD accept feature bits before reading configuration

As I understand it, this should be SHALL (mandatory requirement) -- or
MUST, not SHOULD (which reads as a recommendation). Otherwise it would
violate the spec, and probably cause a hard BUG() panic in the kernel
if the driver queries a feature it never declared in its
feature_table, or result in silent data corruption if it bypasses
feature checks entirely and reads conditional config fields directly.

> +   fields conditional on them.  The driver MAY then accept a different
> +   subset of feature bits (e.g., deciding, based on the configuration
> +   fields, not to use a certain feature), tell the device about the
> +   updated subset, and repeat this process.
>
>  \item\label{itm:General Initialization And Device Operation / Device Ini=
tialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver =
MUST NOT accept
>     new feature bits after this step.
> --
> MST
>
>

