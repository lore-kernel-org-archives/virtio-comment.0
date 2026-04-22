Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FE4340293
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872345; cv=none; b=pTTzqpK9jLn5jIBqPvQTxeBjZ53Z+AOAtjgCpjyJH08Z7efU9A+8r+xznqm7+cb/FeeYgG/QrYxGDr8gQaxGRvGlor5sKUGwoJmOKOGzvmgDdKutBqa6JqZT5dzeYkn0IGfvJN8Un02RQBxYmzCRenGSiXBMD/zyo1pJ/we7w9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872345; c=relaxed/simple;
	bh=dmjBDM3VcYzOEwr2kQkR8dzsOoEn7LR3jTq3IrhOfdQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNoMw8AXgFSMQIrhv585QDNdj8+NriiS+yROO0xt7vBCz+NVo5pUOnvmgKvJ3YMXwyMRRvOZErNUOr0WZG9TvQmIGYardQij9CRODombQa2WYpA5bkNgXy5KWO/DSKItGEMhZgxawfwEJJC+lJbHNBH2Y4CExxeS3fhW/KBRYHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+4mZehW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+4mZehW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776872342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=whTUcJi2sbCuAlbRWsfDFPYhODbH4ZQTuqqIAkEzviA=;
	b=V+4mZehWTFYIQDEAyLVsjdC1OiaDdVprE8FkZYFokSHIYI2hqtiywK6vJ5q0HDnAOb9/pi
	qW7S/roJooWv3tKdm9J70IVp1UFL7DG7UYtZ3ilkH0fAdOd19OkbGQT2R5VR0NQ8HAQx6Q
	ZeQshbAJBbF2qJjD6WFEv8TG+PgcH7E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-dwTkrXIWPU-sBKJXNXQV2w-1; Wed, 22 Apr 2026 11:39:01 -0400
X-MC-Unique: dwTkrXIWPU-sBKJXNXQV2w-1
X-Mimecast-MFC-AGG-ID: dwTkrXIWPU-sBKJXNXQV2w_1776872340
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d7757463eso3695191f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 08:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872340; x=1777477140;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whTUcJi2sbCuAlbRWsfDFPYhODbH4ZQTuqqIAkEzviA=;
        b=mvYM8vHtJsEGHHFtU/K2VYHk4xA1fqRVvLZzR8xA4Wn3MnEEu3iEgWo4CdlL6Sa/TY
         oTd8tfutSzph9UdDB8a24y2/xFk7e96Kd0Bg8JCweDEfqfxXT1GYpEI6ipRa7uazBaz7
         ApPk9Ax0bPIRBf6ICQNWRueaGouJ9CS6M0KLjV6wf1v4FMLLnb98HloKcE6IHow9WGJ/
         SeCp7onEpeuBTFl440bOgYqwdHOmWuFSChn9nEDn5itLavAXvYCc4kwV2gEW8EMfrvlO
         0wGjupHEkas8pnrw++PJgkbQz9gmdpzA63Kc08ZREt9jRRPLDau5WaAlYZxujRBlKYv6
         4Lnw==
X-Gm-Message-State: AOJu0YyLOTK5yeotKsnmItJFIpCCXgncvt3cUK8S7azoQJnldVSzn1qP
	2UWHe29W0mJMhKkkNLbWiF2W1smAwj1+Xd1Og1yhyL03hv4abUPKE9BxsUDpGtxrds8Fa2Qahzg
	AuKAzAiPkNQfhsUMcqycmTBYBqqP9y3sd5dULlqrULmmJ25W0GztYKHLnzVjTuLQQzdRzSKwJjQ
	p4C07xIFAO1fqr9bOyLHC+2xzJr3FHn0TU/Zv4w1eAdnflVg==
X-Gm-Gg: AeBDievvUWpc+Z9W7GAbngQXrdfVd2BrHo6/aFqkRUopVcwat4ipJn7vXEzwJVtwEPI
	tckQavGsbas50BWUCxjK6hmgd/jgPFQAh92eiPrli79lV1vrD76UlrkqaMt3u2EYAOROASk2/4z
	EpnRiH9VudqWMJ7/Alh2x9bFpuUnIDWxk0xMeoWEU0lXPcaIKGtHW4Dq8uhwCelDXpZxXdoVqdB
	y1ev2/pAiFagrCnJ2O8HDtK95qQknN0PrWGsSD/3jwpGt7Dja+HT+xW+oHG1+hSZHEOkICQTPSF
	1f6aziohjITNLsrkn3VbqCR/TBDzTQzs/xt4cZmJsLF8tk0KzJhJazpOyygMll1WlrH9QBu8IXP
	gMbJnXuXK0VMfGS0AOfKUOMQ0kz9DrjQjk3c/PwJUhE6zONzxnfTpBg==
X-Received: by 2002:a05:600c:3b2a:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48a534af0ffmr133239785e9.1.1776872339566;
        Wed, 22 Apr 2026 08:38:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3b2a:b0:48a:534a:eed8 with SMTP id 5b1f17b1804b1-48a534af0ffmr133238805e9.1.1776872338640;
        Wed, 22 Apr 2026 08:38:58 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm414576255e9.8.2026.04.22.08.38.56
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:38:57 -0700 (PDT)
Date: Wed, 22 Apr 2026 11:38:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] content: clarify feature negotiation terminology and init
 sequence
Message-ID: <bf1eadcd07bb7a72c52612f4eb175cd3c3c246d5.1776872324.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hpE2OOq3U_iwG89HGNOyRJ3rvyz5Wv4AOynVSQHxQ30_1776872340
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make several clarifications to the init sequence documentation:

The Linux virtio core (drivers/virtio/virtio.c) initializes devices
as follows:
  1. Intersect driver and device feature bits
  2. finalize_features() - write accepted features to the device
  3. drv->validate() - read config space, may clear feature bits
     (e.g. virtio-net clears VIRTIO_NET_F_MTU if mtu < MIN_MTU,
     balloon clears PAGE_POISON if guest does not init pages)
  4. If validate changed any features, finalize_features() again
  5. virtio_features_ok() - set FEATURES_OK, confirm with device

this allows the device to know which fields will be read:
recommend this in the spec.

Legacy driver detection is specified using a mechanism that
does not work on all transports. Make it clear that it's an
example: what matters is that devices do detection in some way
and are compatible with legacy drivers.

Clarify the distinction between features written to the
device ("accepted") and features confirmed via FEATURES_OK
("negotiated").

"acknowledged" is used as a synonym for "accepted", but only in two
places. Just use "accepted" consistently.

Spec describes multiple moving pieces then ends with "before accepting
it" - vague, and is overloading "accept". Replace with a reference to
FEATURES_OK.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/241
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 content.tex | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/content.tex b/content.tex
index 5de811f..3dcba31 100644
--- a/content.tex
+++ b/content.tex
@@ -39,7 +39,7 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
   drive the device.
 
-\item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
+\item[FEATURES_OK (8)] Indicates that the driver has accepted all the
   features it understands, and feature negotiation is complete.
 
 \item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
@@ -89,13 +89,21 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 
 Each virtio device offers all the features it understands.  During
 device initialization, the driver reads this and tells the device the
-subset that it accepts.  The only way to renegotiate is to reset
-the device.
+subset that it accepts.  The device validates this subset and
+accepts it to complete the negotiation, or rejects it, leaving
+the negotiation incomplete. Once the negotiation is complete,
+the only way to renegotiate is to reset the device.
+
+A feature bit is \emph{accepted} once the driver has written it to the
+device.  A feature bit is \emph{negotiated} once FEATURES_OK has been
+set and confirmed.  Before FEATURES_OK is confirmed, features are
+accepted but not yet negotiated, and the device has not confirmed that it
+supports the combination selected by the driver.
 
 This allows for forwards and backwards compatibility: if the device is
 enhanced with a new feature bit, older drivers will not write that
 feature bit back to the device.  Similarly, if a driver is enhanced with a feature
-that the device doesn't support, it see the new feature is not offered.
+that the device doesn't support, it will see that the new feature is not offered.
 
 Feature bits are allocated as follows:
 
@@ -189,8 +197,8 @@ \subsection{Legacy Interface: A Note on Feature
 
 Transitional Drivers MUST detect Legacy Devices by detecting that
 the feature bit VIRTIO_F_VERSION_1 is not offered.
-Transitional devices MUST detect Legacy drivers by detecting that
-VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
+Transitional devices MUST detect Legacy drivers, e.g. by detecting that
+VIRTIO_F_VERSION_1 has not been accepted by the driver.
 
 In this case device is used through the legacy interface.
 
@@ -314,6 +322,11 @@ \section{Device Configuration Space}\label{sec:Basic Facilities of a Virtio Devi
 greater than the specified 8-bit size.
 \end{note}
 
+\drivernormative{\subsection}{Device Configuration Space}{Basic Facilities of a Virtio Device / Device Configuration Space}
+Before reading a device-specific configuration field that is
+conditional on a feature bit, the driver SHOULD first accept
+that feature bit.
+
 \devicenormative{\subsection}{Device Configuration Space}{Basic Facilities of a Virtio Device / Device Configuration Space}
 The device MUST allow reading of any device-specific configuration
 field before FEATURES_OK is set by the driver.  This includes fields which are
@@ -530,7 +543,11 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 \item\label{itm:General Initialization And Device Operation /
 Device Initialization / Read feature bits} Read device feature bits, and write the subset of feature bits
    understood by the OS and driver to the device.  During this step the
-   driver MAY read (but MUST NOT write) the device-specific configuration fields to check that it can support the device before accepting it.
+   driver MAY read (but MUST NOT write) the device-specific configuration
+   fields to check that it can support the device before setting FEATURES_OK.
+   The driver SHOULD accept feature bits before reading configuration
+   fields conditional on them.  The driver MAY then clear feature bits,
+   write the updated subset to the device, and repeat this process.
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver MUST NOT accept
    new feature bits after this step.
-- 
MST

