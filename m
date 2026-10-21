Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612266;
	b=nCVjN9Hd6+gyGI1ONcn1qlmrjKq7fRgi545YdovALZcBrKDtkhon/+3YcRlfpOJsqw/G
	 CRXq1YJEQ2GR5QGqNPcQEv52sgRtBcbXZfc0ycGXgKtYV2k1IG2QxUChPKN13Ek7wfqpc
	 zoIjzzKS8RVGH0UQApi1KQ8Qouo2/kAke5Iq9R5ib6fTmGKd/TyHcYAFmHw47cgui3PDr
	 VKB3H6D/WoCpYRDHchIDmrbV3gtB7bp8Y6eu8ImEkure8clqX2xvP5fHl13g5NU2WruJf
	 FQcT2dxHtzvfIKz6JcJbpUbyz1dycaM6Qqdb6vD8ZAmaeom+aYAuRW0obO02twE4asg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612266;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=lk7dDjIS1TXXUmBwH5jQPkVLN1nxaNlJA/0TZdlYWHM=;
	b=C4QuYa4d8qnqJ/rNeUhR0F5VQDs3KWzUTmZtxBUcGGifmr71oX7q9kkYpyF8wuOYwqBI
	 ipQqDZKx84L8lA9Ra5/wW3QwKj4oKfuLO29Ro154W+ZyfgTsRkkycj4ElF+ZlLq2Sz/ng
	 kdZMzT54r6zQsbrpM52noeqbbJZ+xFScRQhagEFE8SEHPomQzZuaIujfeZmrgHU4/zCl4
	 GCDM5Abv3GgiA5U7fHutYDXF7+tY9jQnnmyImkgEaXVHdTdaIT4u2XQwF5n5P2f+yGlJ/
	 9t3HNIWwGeju95Lv2rGCXkhyIadhrtogZtpnZefmp1h5htIlqM7aIpnSOGcNtJZmOeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YhFmb7nR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADAE606A319
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 19:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADAE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YhFmb7nR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792612265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lk7dDjIS1TXXUmBwH5jQPkVLN1nxaNlJA/0TZdlYWHM=;
	b=YhFmb7nRsOaGmojYi8664hpy2GBPZKeSasLHeP/jC+iLgaM2YYq1CF99uj82qQIB14Vf3o
	JJj3MOG1e4PAZH+I81Otu+mJd/VOApeSVbXmSKd7fskIgMI11qLxKeR7CxfyGm3zVCry19
	pfJgjATUJKNcu0L3lov1Iqz0iC3y1Ak=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-Cnzc0zkMMtK2S2FDNexh7Q-1; Wed, 21 Oct 2026 19:51:03 +0000
X-MC-Unique: Cnzc0zkMMtK2S2FDNexh7Q-1
X-Mimecast-MFC-AGG-ID: Cnzc0zkMMtK2S2FDNexh7Q_1792612263
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c415561aaso716949f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 12:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792612262; x=1793217062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lk7dDjIS1TXXUmBwH5jQPkVLN1nxaNlJA/0TZdlYWHM=;
        b=OxGvSMCKdyrVum5G/leOhL76AeUAKDwy13mZY6gyhkwIQAylKTn29sme3JYesl6ioD
         4g86w8IIVv3w7i55ley0c4Qyrjso5OUmanj68hQQNeOSPHtwnsUbH4xiuUu6y1IhG91X
         ENK4nzx2VCoveaWfFhO86BV4WsfBCxfw+qH0vuI1U4iI3xYZXmJqAoI6CrJ66cXZ0Ro3
         nH1KKzgNKdjXSRbBZRbSTTFM//iV1H/cicdxujHUXpygXopGWH3sfYT22L18hVDgO+9G
         R72adpGzrsZJLqzr3t8qqiKdrclX5760abUL7kwskurcrsJQs5FMb/QxDJayUaixRv4y
         LPWg==
X-Forwarded-Encrypted: i=1; AKwUvBzLy0FITOHzsCQf/eLZ+Fpzpx5nLtJjznI7WozI7KrS2f5hEaFIuQZVBnplvM0UoaN/fh6ABSZWgl2zWRrisA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLUinNX/1bM1HQGBAImlY1eLoLmMEYniu4ZUoCja5fIwaXNtIi+
	Ez2n0GWoAx3WDdrvz+T17TeBEizX64XSlIccoVc/v12qM26wwgMzuU4RTQNY5lCT9GctlPTTuxP
	Dtj8WaZCVuWTG/kP8A/ZZVNgu2QxjV6N88jpybfjMCV43wodhetTJsHaHED+pwCCEPz3x
X-Gm-Gg: AYBFou3vdaZS5qXj0+9gJYRulkiZzWXW/8dTheKgeHkP2SIQHGD9KMEBeQd0c3IEM1F
	gGujK5JudZXtfv1bD59VIh51aRQPx96nf0noCCIRSFJSAiu8ee6jZEYdxv73aKA+YeClb+vQ9Di
	8/2Yoa0BOoOwbBt8T1uZ+8B3PXgYYA6kHoIGfzidJrgekOp+qT6+f9g8Rtn1/uxnCAgUwVkMYzp
	f/y56A33RzbK+BOn8sBAXGfJwtusY57fIOBxM9zSNdfXGYs4EUlQ0z7cRAqyVBuYT4soVPQT7dY
	eGfiWCD6eIDrphXc41r6MEQ07YNKnuhnxiZEqMpvJcwz5x1rZuiLmo0XpApClGIMq8I=
X-Received: by 2002:a05:6000:4b1d:b0:48b:10c8:2183 with SMTP id ffacd0b85a97d-48e264c3442mr6684005f8f.32.1792612262421;
        Wed, 21 Oct 2026 12:51:02 -0700 (PDT)
X-Received: by 2002:a05:6000:4b1d:b0:48b:10c8:2183 with SMTP id ffacd0b85a97d-48e264c3442mr6683964f8f.32.1792612261879;
        Wed, 21 Oct 2026 12:51:01 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm8328142f8f.42.2026.10.21.12.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:51:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:50:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Peter Hilber <peter.hilber@oss.qualcomm.com>,
	virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261021154801-mutt-send-email-mst@kernel.org>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xVJ88zi18LTf8WKiOYuLjHUEd1ROBH_G7six-T25GUQ_1792612263
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 03:25:31PM -0400, Demi Marie Obenour wrote:
> On 10/21/26 14:00, Peter Hilber wrote:
> > Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > Firmware Interface). QPSFI devices expose functionality across SoC
> > subsystems through a common Virtio-based protocol. There are no plans to
> > standardize the devices.
> > 
> > The Linux DCP display driver series is planned as the first user of this
> > device ID:
> > 
> > https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/
> > 
> > Device ID 51 is already reserved for the Virtio HAB device:
> > 
> > https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> > 
> > Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> > ---
> > 
> >     v2:
> >     
> >     - Rename the device from "Snapdragon device" to "QPSFI device".
> >     
> >     - Refer to DCP Linux driver patch as planned first QPSFI user.
> >     
> >     v1:
> >     
> >     - Was posted as "content: Reserve ID 52 for Snapdragon device":
> >     
> >       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/
> > 
> >  content.tex | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index 243ce2dde36b..7416939e67d3 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> >  \hline
> >  50         &   Video encoder/decoder device \\
> >  \hline
> > +52         &   QPSFI device \\
> > +\hline
> >  \end{longtable}
> >  
> >  Some of the devices above are unspecified by this document,
> 
> I think it would be best to have a single ID for vendor-specific devices.
> I believe most of the ID space has already been used, at least for virtio-PCI.
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)

Sounds like a good idea to me. And then qualcomm can do what they
want, like check subsystem id for pci or whatever?
Only issue is there is no way to distinguish for mmio/ccw.
Maybe, add vendor specific id as first e.g. 8 bytes ro in the config space?
Peter?

-- 
MST

