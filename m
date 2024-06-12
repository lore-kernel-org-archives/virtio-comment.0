Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3330B22092
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170460; cv=none; b=Wm9ZjKtDFbc3Oczpc4tVLXGSM0nWelcYgu6iBOtA1J20XHQB2EbGzNIi8vDz6JpS0MAaa2oIWktXRGo+AQCHOctiyk/9MQIm4beuIUHskiuEoEZqyCot6z2Ey808RiaPnOcYJmRvQsMv3opm+JqDPZ6i4JrHWuMpohD1T4jXCaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170460; c=relaxed/simple;
	bh=J8P3/kEQtV7naeXHp0gZpD3igb2I4tS1u9y5YvTN0q8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0xyyc/u2E5HzrsL4uYgMPXjPmOCqA0cfJ3otdI088rBX04zekK6YxIxf5gjh8mQbWiYROQ85reGBCd5Qj/l441xBInMyvbAhaxxQs189Vwj3obzd8KWubLQh5FtYGNK1MknFkEUSKYcKbjET6PiAySgSFAeaxAGkeD61eHabfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRN9vj+5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRN9vj+5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f6fd08e0f2so27060285ad.3
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 22:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718170458; x=1718775258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Du6UCUH8GRa3AhJJXjort+rdTXbcCKqZQ879GdzqVNc=;
        b=LRN9vj+5lGlrXtPrdzbk3GsUG02vcui+DmBC1sVnE4XRX/09H0qdY+W4FL0kDWBWTk
         cVg7rNUmOfaZYAGh8furBn1YmkPnK1Ri5OzW0FEY3Bp7P7J01w+JEzyNDkvAyO/pPRbR
         dy89gzlt9uLd703viIzaO9cysRIS5zqqaWTs8X5m1o9J6BUVUAGCZdCnp60e89VytiPl
         VLI4NdBiKh4h3B3IpyOg1jNK+h+EBNgspVo+V6k6Ns9y9dKSLpr+LD8vE1hAo6MuM9bI
         sGqig5djP6IwZcZHyUUrCjYFlP6X/I3P576DP48w463EJtcwHcUlyjAmDAjYu2bSdx2F
         gLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170458; x=1718775258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Du6UCUH8GRa3AhJJXjort+rdTXbcCKqZQ879GdzqVNc=;
        b=XiSO+2EOPXIq2W3k37xo6H/zF2MKsYsMIpg38xUlXu6OG/A0U0M8RQdGo55NQRbNHg
         OoRPFxXSdpQePWCneDTRoqtjO2n3plKRZ59pcc1WtqM+wv7jwCQGoZrwlMie93bEdHP9
         1C4N0iio4ZvcdctSc1zJ4V/7O0+vaSrG7EcD8PfbHqhS8cm53CztWhFPuh/JTO6d47zM
         d+3Uc7vnLo9xBKYdYVMp9S2gziP3EoF2pueRH1ejR/PaBdYnZP+Eb6eOAZFAqtOKycMi
         0uUaXN3+sDYDt+kO1vZBqRgOhpg9k3FeS/rQ0Z08RslxbtPUIwh7/dtnb2XIJ2e6ADyD
         SS7g==
X-Forwarded-Encrypted: i=1; AJvYcCU0p+M98nSH0vo6zi5opkTK39xU/YULDWowluTE099xRJbST7odEESJxch6CMtdDaYiQSh4873KJtAKBrn4at1A4XCfvGXLbGVa/1lVSgo=
X-Gm-Message-State: AOJu0Yx/fQeqdZErVxSRYFSYsUmYJStukGcozpmfwnvtnkmf9G5OEPpR
	kHnn0M0rVUZfa87sauLHTMbLKouWsXzN3vHTSy2bQcHK4p++uj12EE1baj9OE5IpYg==
X-Google-Smtp-Source: AGHT+IHMQWrJWj2ClsS4X0VlixRPKC2jpaMYa4M4fzxBXsoDCuh3ztWiRZegyov3vfb7ek9d2vb3HQ==
X-Received: by 2002:a17:902:b20b:b0:1f7:1688:9e36 with SMTP id d9443c01a7336-1f83b6fc30fmr6992805ad.48.1718170458372;
        Tue, 11 Jun 2024 22:34:18 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ed896cc9sm78311035ad.232.2024.06.11.22.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:34:17 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: hi@alyssa.is,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev,
	fupan.lfp@antgroup.com
Subject: Re: Re: [RFC PATCH 1/2] virtio-vsock: Add a `VIRTIO_VSOCK_F_MULTI_DEVICE` feature
Date: Wed, 12 Jun 2024 13:34:02 +0800
Message-Id: <20240612053402.2428882-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <oxsnc7lbs7m5oreu37aozu32p4kqts7ba5zciib62arz4jhurw@4we3bibx6quf>
References: <oxsnc7lbs7m5oreu37aozu32p4kqts7ba5zciib62arz4jhurw@4we3bibx6quf>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >The feature represents the users want to enable the multi-device feature
> >once it is provided by device.
> >
> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
> >---
> > device-types/vsock/description.tex | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> >diff --git a/device-types/vsock/description.tex b/device-types/vsock/description.tex
> >index 7d91d15..3fbc02a 100644
> >--- a/device-types/vsock/description.tex
> >+++ b/device-types/vsock/description.tex
> >@@ -20,6 +20,7 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > \item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> > \item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> > \item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not implied.
> >+\item[VIRTIO_VSOCK_F_MULTI_DEVICE (3)] multi-device is supported.
> 
> What about "Driver supports multiple devices." ?
> 
> > \end{description}
> >
> > \drivernormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >@@ -34,6 +35,9 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the driver MAY act as if
> > VIRTIO_VSOCK_F_STREAM has also been negotiated.
> >
> >+The driver SHOULD accept the VIRTIO_VSOCK_F_MULTI_DEVICE feature and allow
> >+multiple devices to be registered if offered by the device.
> 
> I think we can skip this. For the previous features we added it because 
> they are dependent on each other, so we had to clarify the relationship.
> 
> >+
> > \devicenormative{\subsubsection}{Feature bits}{Device Types / Socket Device / Feature bits}
> >
> > The device SHOULD offer the VIRTIO_VSOCK_F_NO_IMPLIED_STREAM feature.
> >@@ -45,6 +49,8 @@ \subsection{Feature bits}\label{sec:Device Types / Socket Device / Feature bits}
> > VIRTIO_VSOCK_F_NO_IMPLIED_STREAM, the device MAY act as if
> > VIRTIO_VSOCK_F_STREAM has also been negotiated.
> >
> >+The device SHOULD offer the VIRTIO_VSOCK_F_MULTI_DEVICE feature.
> >+
> 
> Ditto.
> 
> > \subsection{Device configuration layout}\label{sec:Device Types / Socket Device / Device configuration layout}
> >
> > Socket device configuration uses the following layout structure:
> >-- 
> >2.34.1
> >

Agree with you, I'll update them on the v2.
