Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB53E142625
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246005; cv=none; b=iZvF4NQYQwrSV5H36BllLWAa9l4N76JVO2tBuxHkpmRFVNFIxGdau4PWBooCsyZ6QZ6iZb9CkPN0ZISGZKNgT0lWbJkhDDH9ghFg9J5N37P1XTHfO+V/mLFxHzl1iqkb+eIbupZ0GSFrjAUmqvhkTQoRGebkBszGad0dG3JPe4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246005; c=relaxed/simple;
	bh=gFgAOdQCxyCFLt3MXsQ99AUDJnpLPSMptrgvsG7eTGE=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kzsCn/XjuFLnM8l/mjMjbBqVZPbRK1eqEPuEz9DOreQXBbYI5M71msqViBv825THXld+S3dhZnc3I9Spd5oEPG6Lee325JhPBDOQcU3LFMEDmsb6DjQxL75fnPZh7Do5BOpJ8t3fRc2ksovkkxnxryf3wsc85g4DLkVKcCDeyto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbYsfWUb; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbYsfWUb"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so3359619a12.0
        for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719246003; x=1719850803; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJI8vICRi+sY9mQN3oqHy/6EoGyJNHdslawz3XXq/R4=;
        b=gbYsfWUbQgdO6ygehEpfFCU/K45BOqwQdXrurqvpuyapaGJmgXkU0JyZc220R1nT0I
         u3vcTBCxEs2IgMOLrPbvXZcP3EoP9RidfVaqKuoVIERufhBs4AjnttJvpIYNIB/eCBSq
         ddIXDmALaIjWKj4ehdpeI/13wSZNEQIfCJV8s9TeAVD7c5L1t6mJaZpaJIsxx7GYXK4H
         hYRNDDpqWITovmLgHO9Cvu0yTnRG8M/f1IdW7OqaMYLCvEIdt4QnqlCq1sBjTep4GfIJ
         Kyu4mjJECCTKssF1KUFkP+3/FJNNHjZTYmI/F+rnk1mNPBRHB1IcBBazQUxKGFr2uPpW
         PInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246003; x=1719850803;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJI8vICRi+sY9mQN3oqHy/6EoGyJNHdslawz3XXq/R4=;
        b=LyhLnz8+ivMW70fmTo8zO2eLr6VZExa6TZmZ7eNeWPPVS/+P4fLdkRaJXnBztgior+
         XiI1CEZNMNwFkLA5/lX5N9p2o8HnwC52tvmkpgUDKC0sElxAQTGxm5+vZU2KPZX34lLx
         5Idn+TBXgadGsYMkQSaS5MtaBu6MnSVudHq0ttL7DB8VQwenejCVTDKGYCvlgGn0Rz8r
         9Cn4FwhjU+D1QP0+ZBBtN5lcjBTljQkdJumufCgW3I2dYf6aQPSJX2q7gRgpfQYB6QOj
         sSfx4MAdWl+4/qUvY1iIdG0Z2YTq2rN4z8YrG1nv5iEsJHYUbt//PfYHbP7u1SyhNqXS
         i4Mg==
X-Gm-Message-State: AOJu0YxxvWjei1H5s5/MrPmPa+VmwgWykV8jWibz4Qu3Yza0GpR3P/Uy
	5mcICnBc69lnmP0J4ZFiD5bWoEWMjCoG8zvI9GHHEH6WLyPfLIxi3v9cfQ==
X-Google-Smtp-Source: AGHT+IHKgTKUVuaLLxmKPMv9hTSLjKDiFnmLxtQu27IXEEv7t9/Myo/cfWyt5QqcKnPYKS7Xxk1v4g==
X-Received: by 2002:a17:90b:4b46:b0:2c4:fc64:6b81 with SMTP id 98e67ed59e1d1-2c86147c06cmr4467262a91.31.1719246002546;
        Mon, 24 Jun 2024 09:20:02 -0700 (PDT)
Received: from thinkpad ([117.193.213.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819db94cfsm6901963a91.38.2024.06.24.09.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:20:02 -0700 (PDT)
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
Date: Mon, 24 Jun 2024 21:49:57 +0530
To: virtio-comment@lists.linux.dev
Cc: mie@igel.co.jp
Subject: MSI for Virtio PCI transport
Message-ID: <20240624161957.GB3179@thinkpad>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

We are looking into adapting Virtio spec for configurable physical PCIe endpoint
devices to expose Virtio devices to the host machine connected over PCIe. This
allows us to use the existing frontend drivers on the host machine, thus
minimizing the development efforts. This idea is not new as some vendors like
NVidia have already released customized PCIe devices exposing Virtio devices to
the host machines. But we are working on making the configurable PCIe devices
running Linux kernel to expose Virtio devices using the PCI Endpoint (EP)
subsystem.

Below is the simplistic represenation of the idea with virt-net as an
example. But this could be extended to any supported Virtio devices:

           HOST                                    ENDPOINT           

+-----------------------------+         +-----------------------------+
|                             |         |                             |
|         Linux Kernel        |         |         Linux Kernel        |
|                             |         |                             |
|                             |         |     +------------------+    |
|                             |         |     |                  |    | 
|                             |         |     |       Modem      |    |
|                             |         |     |                  |    |
|                             |         |     +---------|--------+    |
|                             |         |               |             |
|     +------------------+    |         |     +---------|--------+    |
|     |                  |    |         |     |                  |    |
|     |     Virt-net     |    |         |     |    Virtio EPF    |    |
|     |                  |    |         |     |                  |    |
|     +---------|--------+    |         |     +---------|--------+    |
|               |             |         |               |             |
|     +---------|--------+    |         |     +---------|--------+    |
|     |                  |    |         |     |                  |    |
|     |    Virtio PCI    |    |         |     | PCI EP Subsystem |    |
|     |                  |    |         |     |                  |    |
|     +---------|--------+    |         |     +---------|--------+    |
| SW            |             |         | SW            |             |
----------------|--------------         ----------------|--------------
| HW            |             |         | HW            |             |
|     +---------|--------+    |         |     +---------|--------+    |
|     |                  |    |         |     |                  |    |
|     |      PCIe RC     |    |         |     |     PCIe EP      |    |
|     |                  |    |         |     |                  |    |
+-----+---------|--------+----+         +-----+---------|--------+----+
                |                                       |               
                |                                       |               
                |                                       |               
                |                PCIe                   |               
                -----------------------------------------               

While doing so, we faced an issue due to lack of MSI support defined in Virtio
spec for PCI transport. Currently, the PCI transport (starting from 0.9.5) has
only defined INTx (legacy) and MSI-X interrupts for the device to send
notifications to the guest. While it works well for the hypervisor to guest
communcation, when a physical PCIe device is used as a Virtio device, lack of
MSI support is hurting the performance (when there is no MSI-X).

Most of the physical PCIe endpoint devices support MSI interrupts over MSI-X for
simplicity and with Virtio not supporting MSI, falling back to legacy INTx
interrupts is affecting the performance.

First of all, INTx requires the PCIe devices to send two MSG TLPs
(Assert/Deassert) to emulate level triggered interrupt on the host. And there
could be some delay between assert and deassert messages to make sure that the
host recognizes it as an interrupt (level trigger). Also, the INTx interrupts
are limited to 1 per function, so all the notifications from device has to share
this single interrupt (INTA).

On the other hand, MSI requires only one MWr TLP from the device to host and
since it is a posted write, there is no delay involved. Also, a single PCIe
function can use upto 32 MSIs, thus making it possible to use one MSI vector per
virtqueue (32 is more than enough for most of the usecases).

So my question is, why does the Virtio spec not supporting MSI? If there are no
major blocker in supporting MSI, could we propose adding MSI to the Virtio spec?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
