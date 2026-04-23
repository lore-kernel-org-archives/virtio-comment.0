Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491F33436A
	for <virtio-comment@lists.linux.dev>; Thu, 23 Apr 2026 22:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776983060; cv=none; b=hK1geJWCzKiRQ2e7hgQOT3xMW3yfTE0b5pDhQqVbhIE+28s7mNtwy5FflT+9QIEn9zJ5Z1SPVI5OZp4e61rX4z5NDYpIDLGV2c8Q2lNzv7oZ33upplnNmJZu1rmNERP47CGfCLqerUNCMABhjf11IJHkOZKi1kZc2lc1XIXWTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776983060; c=relaxed/simple;
	bh=p2lLuqbjtXSsCjhqbpDhX6VOi3V1BDzmT3aHjDkUk6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uVtNpga2ovW8Op27JYmNK7rnUg6hRjXI8o/dSHsD1cLm1A68VKsyhr9/NDD6T8G874GeEYN07kEFSvik4XFdEruAb5GSICpa0iCRb+iqicsbdG7l28BGTY8OCRIb6u6FZm9v7W+HIX4v4lZzuZ+3Go0lprczBb2u7Ij4d4EsN4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KmaPDNPR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KmaPDNPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776983057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=xOsWt+aRjpN+22CfCXD5sQb0MiPGEr+ZsoLQf6DRqI8=;
	b=KmaPDNPR0JTV4bbQz80mox5AFltpiNdXkbUX6Ne15fm+V0FrGzjr5yOqgxqcubGEP+FwWQ
	zMMEmwcS3HjLUZyy62/dh0ia1nn/SeeUXkDczpiBNPyuX2eggvQHMGK6yZTaR3Qs7K2dXh
	z0ZRxKAG4oRvnf12oUHci0Mhf1ik3jc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-e7YcV6Z9OkOTG2o_acRonw-1; Thu, 23 Apr 2026 18:24:16 -0400
X-MC-Unique: e7YcV6Z9OkOTG2o_acRonw-1
X-Mimecast-MFC-AGG-ID: e7YcV6Z9OkOTG2o_acRonw_1776983055
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d03065782so4705514f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 23 Apr 2026 15:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776983055; x=1777587855;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOsWt+aRjpN+22CfCXD5sQb0MiPGEr+ZsoLQf6DRqI8=;
        b=WPzrv8qQ/HgJhwbAjiEgVyE1IbggMDrQ81QIJzq/BdEZd31CzrNd1EGGS9ImugNkk3
         fS6LRPq9VrwwqeOYLf5FMerRiLBSbVl/+N05vPgKLAxcwOjn54Y3swxb9I7ZljJTuRJ5
         DzrA9d8sTyXt4H+JK7tkvJabG3doFhCmR40JJK0LvyEwh58vRpeFmL3Kw9DrDotqqnFV
         /7FKzVzc6F1j7okC/comjvn3A/+o3/PnY+OH5Q5K7/IMyNDip0yMsVVfiHvF6pJIt0cz
         caVk6sPi+CfhJdhI6HTJoDQ7MHTSSvg7ATqDbxEjO4VaNt3Ry0lQP3kEtuUKS6LgtFPa
         HLmA==
X-Gm-Message-State: AOJu0Yzs+T2Tr5F6Cuz9zNv1bFPdhyibErfc+afTsb25795ZQVnz05FW
	a145e3PP598Bw0BMmTWA7YunbYr1g6aEYBCAH72pQjKjkHjMdzO4om2Ss5MgYEu891lfSBRV0C9
	Flcse22ZLxnv36VlxvYtm6iQgsumb+afb3L2Lhcy8aSVj425pbPX5w5NmrPITl8OuZfEBBcXMtN
	oXQ2gQ8Z7zvF1HLc88g4n+t7AQEz1r9AE4qWz9GoquLnb+Lg==
X-Gm-Gg: AeBDieu+Zl4ioOwiHFYZYrftEfZRfU68gg61WhFIp2Kopy22fkI0X+0Gi4Gas09U9sm
	5iNiJdlJriXieVNAW86sWA97G7PD+j3WOR6C4wN/OgdslwisEDz98QUvhe4jTMuebxwMyObeaUK
	pEAW9RC4Shl3QaRApA6h6hke3XwA4PajwYs1jhM689ATVzby8g1KFD/7oxKO0Eb2eMejnMS1caJ
	/QxfI2cCOWnbvdTOYwucGgCXc8V/4kaGoPDxzMfmT50Cy2BkWbFZA0TqmMlZ3hZLuCndxUlqMG1
	VEJ4JmQtgCjerCFJeOjg30ZJSb0IwMDYL7RxDTyR0BGdvL/vgfdaWFh9pL+1PDjwI4a9GctifgI
	A0emOC5Vigbum61VIDXcm1BxlXWpipbGAqdHg6gTJmNo/SYt34/1pZA==
X-Received: by 2002:a05:6000:2511:b0:43e:b0b0:629a with SMTP id ffacd0b85a97d-43fe3e0a1bemr43743904f8f.34.1776983054882;
        Thu, 23 Apr 2026 15:24:14 -0700 (PDT)
X-Received: by 2002:a05:6000:2511:b0:43e:b0b0:629a with SMTP id ffacd0b85a97d-43fe3e0a1bemr43743850f8f.34.1776983054223;
        Thu, 23 Apr 2026 15:24:14 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e46898sm59364074f8f.27.2026.04.23.15.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:24:13 -0700 (PDT)
Date: Thu, 23 Apr 2026 18:24:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: stefanha@redhat.com
Subject: [PATCH v2] content: clarify feature negotiation terminology and init
 sequence
Message-ID: <05b081b9c5a3a904fda3e378ca3e91a2c9375c27.1776982968.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LKt3ZYfpwLJ6HQynSXu-61WoXqPfeg5xR5cNplBhrDo_1776983055
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

Define "negotiated" for features confirmed via FEATURES_OK.

"acknowledged" is used as a synonym for "accepted", but only in two
places. Just use "accepted" consistently.

Spec describes multiple moving pieces then ends with "before accepting
it" - vague, and is overloading "accept". Replace with a reference to
FEATURES_OK.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/241
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes:
address review comments by Stefan

 content.tex | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/content.tex b/content.tex
index 5de811f..0f4d662 100644
--- a/content.tex
+++ b/content.tex
@@ -39,7 +39,7 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
   drive the device.
 
-\item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
+\item[FEATURES_OK (8)] Indicates that the driver has accepted all the
   features it understands, and feature negotiation is complete.
 
 \item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
@@ -89,13 +89,16 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 
 Each virtio device offers all the features it understands.  During
 device initialization, the driver reads this and tells the device the
-subset that it accepts.  The only way to renegotiate is to reset
-the device.
+subset that it accepts.  The device validates this subset and
+either completes the negotiation successfully (the last subset of features
+that the driver accepted is considered negotiated then) or fails,
+leaving the feature negotiation incomplete. Once the negotiation is
+complete, the only way to renegotiate is to reset the device.
 
 This allows for forwards and backwards compatibility: if the device is
 enhanced with a new feature bit, older drivers will not write that
 feature bit back to the device.  Similarly, if a driver is enhanced with a feature
-that the device doesn't support, it see the new feature is not offered.
+that the device doesn't support, it will see that the new feature is not offered.
 
 Feature bits are allocated as follows:
 
@@ -189,8 +192,8 @@ \subsection{Legacy Interface: A Note on Feature
 
 Transitional Drivers MUST detect Legacy Devices by detecting that
 the feature bit VIRTIO_F_VERSION_1 is not offered.
-Transitional devices MUST detect Legacy drivers by detecting that
-VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
+Transitional devices MUST detect Legacy drivers, e.g. by detecting that
+VIRTIO_F_VERSION_1 has not been accepted by the driver.
 
 In this case device is used through the legacy interface.
 
@@ -314,6 +317,11 @@ \section{Device Configuration Space}\label{sec:Basic Facilities of a Virtio Devi
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
@@ -530,7 +538,13 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 \item\label{itm:General Initialization And Device Operation /
 Device Initialization / Read feature bits} Read device feature bits, and write the subset of feature bits
    understood by the OS and driver to the device.  During this step the
-   driver MAY read (but MUST NOT write) the device-specific configuration fields to check that it can support the device before accepting it.
+   driver MAY read (but MUST NOT write) the device-specific configuration
+   fields to check that it can support the device before setting FEATURES_OK.
+   The driver SHOULD accept feature bits before reading configuration
+   fields conditional on them.  The driver MAY then accept a different
+   subset of feature bits (e.g., deciding, based on the configuration
+   fields, not to use a certain feature), tell the device about the
+   updated subset, and repeat this process.
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver MUST NOT accept
    new feature bits after this step.
-- 
MST

