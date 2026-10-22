Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792686579;
	b=EHGNKp+YuBYv0P2OSZa+t1v/yT/gSmPkp/5lruP6oAtzSmEeYBRnoY00F0Q1SjjC2D1O
	 uuMWs+W95QuhXxw3ye2163e5U1okAe6kUY7J5iwrGy6jr5VaDRFBxntmQpzpQF47ZIhhK
	 XD8Ug4azD3cocm3dLdHCbV/Znt4OdGbXTlgi1yptlYorIiYXv9umMhuAV1TF9szGKRf34
	 3Tyi6XBsTgiyFjKn/1FpyKn9kd4RuMzsAkAC4gz46yg/33sqdqK8FHAMm0eaQnm9AQYCU
	 b83B5vagcZ94QPlTf15PHiHGvmBGkUJQdSCoh8UdpjQR4z+JOliqRXQ/iujYwOfmRVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792686579;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=ToPDAJwQNRckXMaDxFkcu9tjkH1sbzqNjDoBP8SBAHk=;
	b=Oo+Gc36lwPLWf0lLAk/qJpL3nJQpsHFuHC8FYV/qg9TaAdu3644lmAQywhHYKCewbj7o
	 Bc8pA8pLCHsy3eO6v6pJFIbPdCe8+yZ2pYQBZccVsHKt3U4F6wNcu2Ng4/KcGlkoFheNl
	 ysWmm+KW+IdihhoRgJU4BpJDVEH9Gv7XuSQu/K6tlvv0y4lq1LMp5s2d22SUXzTOE9L0h
	 DmgkjH/s6h1Alri6QhMfAM2i3IQY9xL6T2qHP1DERCBBYWmo935/SQVwEclxGw+yzojnE
	 7ejk6ADkoxQVWbRClpIUS9l6vvP0YBFflXCqRhYxn6Bg9zPl3Fgb6EdPsv00yRkIKZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IneHtHDd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366EB606A31E
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 16:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 366EB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IneHtHDd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792686578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ToPDAJwQNRckXMaDxFkcu9tjkH1sbzqNjDoBP8SBAHk=;
	b=IneHtHDd680tv+x6wjQAcYNXwz8JHM07Lp50Fj3Gpgr6VbBdK9lCGTam4sC18eWSgxDIj1
	geeUK5XRq7O1eDX53m8+D6qT0wyYXwawPg+IXhdGRyQvL+6kGwAO9xMG3yZdfEibhtu0io
	PZZku7m+FM/kuzdYbFNOY8xWAFRvdRo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-FfWNUiPGMmuEbXAWak3n-g-1; Thu, 22 Oct 2026 12:29:37 -0400
X-MC-Unique: FfWNUiPGMmuEbXAWak3n-g-1
X-Mimecast-MFC-AGG-ID: FfWNUiPGMmuEbXAWak3n-g_1792686576
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20fd059ddso242745e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 09:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792686576; x=1793291376;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToPDAJwQNRckXMaDxFkcu9tjkH1sbzqNjDoBP8SBAHk=;
        b=VMPqrnHahpFp8T/C1yUOT5kbHL+QEHDk31Wga+CFYso6hS9fcYhKKGdiJ4s2K4F/eM
         EYZohQHaOz3OX8DP6VnsfZECL11Iuak7Z4nLcTzF2wF7f2wZTB7S5wUeaQ5lfYG8UT0S
         Qa4UGfTbGcEoS5JZmC4cpa3K63R1DarkIZd2N3OZukybxCvqWqtRzZGeo/xH1gCprgdP
         IbX1YZfJx54PZ1EM1FkuCacjHofpEO0kk90T5FkRXvxojsulX+2rCuiOLh6WWXKdCS0i
         u2gBfIiBP0wW9fTJgs51ROUUFzH/FNXUQbYeQws4jFGNhqdug97eN14TnS6+ANslqARg
         GbXA==
X-Forwarded-Encrypted: i=1; AKwUvBypp5lT9KNQiUw4Za/UaMPVCWy8sWF3RCKrrcU5+UD6P/9zuTzSuhyBcZayLbiN+jgIYs1gpEoibBYJIF9oeA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLjgjb5T6twgN604WJKB4MECvO5O8zQymX+ONRP9g//TiVe5DpS
	sP4tiAyNHycWOsy/dg4zvUznsMqEKo6CHuXbG8hlWqPqDtH0e5wI6zSH3peKA9ndVZI3q7ulH72
	JvsHw9jD8sPxJaKu11UvWEZLJpZ6x6/UtFqiSmtWbnRgrgO2Ea3KpzLt2oEy/54DGX6eN
X-Gm-Gg: AYBFou33cXoxH4xvEU9qKt5pXcrW1Ku2/gXi1mu8JCtH3+AOBg8ScW4HAIEi/1LSlnr
	2goFDm8evyAaFQmivzTwrus5qv3mFRHK0tJdLTocCebpV35vIJ3hzFqm34jSXqN5ZWOt0Jj/2EG
	KzGB5L2Ye7WPkxllVzf2xnmoHJMqNeYou25WoriBXMhREJ9lS3Tn/yftZu6t5aAqxw9z+B84iZ5
	Iua0D1vH/ahlwDZQebLfXt32WgdXvQEaBRQOwTrha2H5Nd5Iq7p5o8e++n2x5wNPgbXVwd0iRKD
	/DtScehfYXUQJvODQmMFFVattdhrkHrG3o7FCw5pg79USv1gGgFcPs8VP7+PheqiXdw=
X-Received: by 2002:a05:600c:3546:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4a20e0c2b7amr15584615e9.16.1792686575638;
        Thu, 22 Oct 2026 09:29:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3546:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4a20e0c2b7amr15584115e9.16.1792686575141;
        Thu, 22 Oct 2026 09:29:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd59482sm97140045e9.4.2026.10.22.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:29:34 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:29:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261022122727-mutt-send-email-mst@kernel.org>
References: <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3T0OzNeQU7dR8T_THOjbNHrASkkqrge3ZZfiN7j6XNQ_1792686576
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 04:20:51PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 22 October 2026 09:32 PM
> > 
> > On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 22 October 2026 09:12 PM
> > > >
> > > > On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > > Sent: 22 October 2026 08:35 PM
> > > > > >
> > > > > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > >
> > > > > > > Let's define some standard way for the vendors to declare that this
> > > > > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> > > > > > > block".
> > > > > >
> > > > > > Are we able to use the first <n> bytes of config space for that? I guess
> > > > > > that is the only way that can possibly work for any transport.
> > > > > >
> > > > > > Then, maybe something like one or two bytes for a vendor id (including
> > > > > > one for "testing purposes" or so), and the rest to be used in a
> > > > > > vendor-specific way.
> > > > > >
> > > > > device ids are independent of the transport.
> > > > >
> > > > > but Peter already announced that:
> > > > > " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > > > > Firmware Interface). QPSFI devices expose functionality across SoC
> > > > > subsystems through a common Virtio-based protocol. There are no plans to
> > > > > standardize the devices."
> > > > >
> > > > > So, I am unable to understand why should it be part of vendor agnostic virtio spec?
> > > > > Why a vendor specific implementation of device and driver is not sufficient?
> > > >
> > > > I don't really think we should vendors burn up device IDs every
> > > > times they want something non standard. Reserving ID 52 as
> > > > "vendor specific" so vendors can go wild sounds good,
> > > > but a bit more needs to be done than just reserving:
> > > > document what is expected, e.g. no auto load based on ID
> > > > alone.
> > >
> > > First, you indicate to open virtio to vendor specific extension. This is huge in itself.
> > 
> > Not as such.  It's just reserving an id. People always do things like
> > implement some crazy spec saying "we will upstream later" and later they
> > do not.
> > And then the ID conflicts with a standard one. Suboptimal.
> > 
> > So if we can tell everyone "always use this ID, and use platform
> > specific tool dor discovery, until your device is in the spec"
> > then that's not too bad.
> > 
> > 
> > 
> > > that should be first discussed.
> > > If you suggest this, may be every device type should be able to extend, and not just demux at device id level.
> > >
> > > Second, one reserved id is not enough, because a given system may have multiple such different vendors devices installed.
> > 
> > I don't think we should care.
> > 
> than all 0xffff as one experimental id once for all is good enough.
> than vendor FOO, BAR, differentiation is not needed.

I don't think we want 0xffff, a lot of systems treat that value as
special, pci comes to mind.

> And if it is not for experimental purpose, not sure why would vendor stop at only one device.

They can reuse that id as many times as they want and differentiate
with a device specific or out of band methods.
First X bytes of config space was mentioned. or whatever.

We can add a recommentation maybe if vendors desire that.

> > > So why to bend things so much and re-invent the wheel?
> > > Why for say PCI transport's any vendor and device id are not sufficient to indicate a vendor and device?
> > >
> > > and if so, why to even document it in the virtio spec?
> > >
> > > I guess, I am missing the basic motivation part.
> > 
> > For the virtio spec? Above. For Qualcomm since they decided never to
> > upstream - donnu. Don't care much, either...
> 
> ok. so yeah, let vendor's platform device be in the vendor's OSS zone.

