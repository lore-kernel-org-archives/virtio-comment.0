Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792683721;
	b=3bxTuO7OfFwuiexSyczWSuGwf8srGXunltXi3HooL5O6HFJJ0A/AH9KD3bFFm1JiR9sO
	 IdJ+/t/c54J4Jy38g0tddfhP95twowrukOwXoLR9d1KzLV2ODD+lFPS0P1W32Or/brg8e
	 Z4TbrYBO3zlVU8paFhEc8AzsZbuNnmS5vpktm+KFhAHIxSXfTbUb4RY1i6dy7IwtRKppS
	 zj7aXOCtVQ2eQYqJTvbqlPciDzu8ex2pB3PPPaeW6r/Pe7vHODXzrtxOzJ2c+45IbGttk
	 R6qP5axioFYV3U6q6wZy8F4DK/fCon5YyqbYnfDO7S+DefiVd0NCK98vVBMu6Z43Y8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683721;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=meEAESn9OsNWTki9o4PmWwy4RhiZ+cwv54IjUYaYmlI=;
	b=ySwGyW0ieQ2pxdL77O5JU44VYypHpnVB9Kq5xAVCYnjPIvIcssuJr5/StIftf1Si7Dty
	 Cc3VCjCgbM2chPOWtJlJuvyDHbn0TNe5yO6Jg5ihHebWDxHays1vjFKoDplh3C+Jbumet
	 iBmTqg5zHeQF0UUuFWm3goLw3Px7iDSNu5O6qhz1EL++EnfdnKY8HONq0RpKAQA182dm1
	 Furdp6f92ovIacHGseKBL4rIsDhrK6Df5ZVAuIcm89BWP6kXzi03mp8nuGbKQvkr4p1X+
	 tzz2kePd8VmdVvPzJvwrdB+Y3msJZFJePha2G0CG1gisdrjtyDJPGfu44TbV3Phlfzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B0laV4+d;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241E606A31D
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 15:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3241E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B0laV4+d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792683720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=meEAESn9OsNWTki9o4PmWwy4RhiZ+cwv54IjUYaYmlI=;
	b=B0laV4+dgUvqx1SfzSpEmF7u47N8S4QbDS/aj9B+R1g/09nBBj7xNMj4YnPEJvzOY6/ZJg
	+XCUbF2pHPl2zA+3y4exhS7bnzc7B7r8HqNq6tibpq0DCymj5bIwQtR5ZpDqkUBUGNV4y5
	VXsQpDaOFHBe0HXDSzZBKbddJc6Z4JQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-BytimpgwPA60gYSTL7S-sg-1; Thu, 22 Oct 2026 11:41:58 -0400
X-MC-Unique: BytimpgwPA60gYSTL7S-sg-1
X-Mimecast-MFC-AGG-ID: BytimpgwPA60gYSTL7S-sg_1792683717
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48dff112136so1453363f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 08:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683717; x=1793288517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meEAESn9OsNWTki9o4PmWwy4RhiZ+cwv54IjUYaYmlI=;
        b=EXhKtAn3xp631Pj+6iZAsPryFfddJqJ5Dd9Bj1pBPOANT2XpHnVKom0+noXsH2QArl
         6kPM728xJqzLG7+/nD7NyygwLz+PLcYu2O0+FIBBkGkeRiht8aahqPMQajhTs01N5Yw/
         AQnHIMbgDpNXKSzbo8ASjdJeWp2Zkmexik7rfvoSN/nQQAqwpuoZM9LffS+oSCofQu02
         j5GGkAHkvG+5+lEGGMpsKSklo1VeCfezwMWtFSin+V8KQBLUN81T+6iA1P+MsdGG9zFf
         GTOVi19QYJzNRoK0NLkAc8zI6kD3MSVFSQqMUlDnqjdZd/SN4LABeRDSqi2GpMRG4/Nq
         FuQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVp5QfqBa4rPyOlJilLbdsSoKtZevbR2fWJ+R2EKkYAUQwTkpgM7u6xCn/1xSxeKAtYPYTgZi9AYQxDs2O4A==@lists.linux.dev
X-Gm-Message-State: AFq9FYKB+3/jbk7V09tUDQ8EXU0TQuKim+YZMCBL8RCA4OPnpN5dGqQG
	AmlwTbrjAyr2C6e3hwnuAXPEsqJ1zwW4lSCAi0lcDu1tEffl8BUJIbRovRPbHga5a04L6qlyATi
	FceIxAD2LkrpvHvqqQx5MOokSnMCNrcKg9zOo22i6r5RLDm2JC8XLkzwda4L8IY0BTWTW
X-Gm-Gg: AYBFou3oVrAtZ3e+ApPYwzAkcM10GdveeODcFnNH1Z5+5W8URs448GLpSKhjNtr+2m5
	J1tHaQLZcwWFSMD572h9wrXedrvzeSevje9uWolXkx3SWKr7DWx7LwFsohtsCyglbXHSPAo9069
	Gtm+yKS3ZuWFJ/IRxRupgPMuFsoyYteE0m+my+02Tvj48P40yuzjOO8y2KYu7rp0ZOnmyTxfL75
	zyQ+4fEgT5JBczojN1n/ILf5MrsSY2P8OC/WYBBbgMeoG+rk/ktERHD0zI9ndczq+OQBMyjd21n
	N7WTeS0uXbxx2nkB5kb+5ZFwEmCKM/2JQQNImhDdKqi5aj6z/tS8299TFuqvoPlX57I=
X-Received: by 2002:a05:6000:18a5:b0:48d:f14a:917f with SMTP id ffacd0b85a97d-48e2641df67mr12552304f8f.2.1792683717287;
        Thu, 22 Oct 2026 08:41:57 -0700 (PDT)
X-Received: by 2002:a05:6000:18a5:b0:48d:f14a:917f with SMTP id ffacd0b85a97d-48e2641df67mr12552237f8f.2.1792683716679;
        Thu, 22 Oct 2026 08:41:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258420e4sm12366558f8f.49.2026.10.22.08.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:41:55 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:41:52 -0400
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
Message-ID: <20261022114028-mutt-send-email-mst@kernel.org>
References: <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org>
 <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AHwSoRf-hgqetsJlVX3MbH_5T8PMcfvb6vskjSXtxNA_1792683717
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > Sent: 22 October 2026 08:35 PM
> > 
> > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > 
> > > Let's define some standard way for the vendors to declare that this
> > > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> > > block".
> > 
> > Are we able to use the first <n> bytes of config space for that? I guess
> > that is the only way that can possibly work for any transport.
> > 
> > Then, maybe something like one or two bytes for a vendor id (including
> > one for "testing purposes" or so), and the rest to be used in a
> > vendor-specific way.
> > 
> device ids are independent of the transport.
> 
> but Peter already announced that:
> " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> Firmware Interface). QPSFI devices expose functionality across SoC
> subsystems through a common Virtio-based protocol. There are no plans to
> standardize the devices."
> 
> So, I am unable to understand why should it be part of vendor agnostic virtio spec?
> Why a vendor specific implementation of device and driver is not sufficient?

I don't really think we should vendors burn up device IDs every
times they want something non standard. Reserving ID 52 as
"vendor specific" so vendors can go wild sounds good,
but a bit more needs to be done than just reserving:
document what is expected, e.g. no auto load based on ID
alone.


-- 
MST

