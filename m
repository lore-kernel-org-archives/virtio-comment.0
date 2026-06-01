Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F742282F38
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780317585; cv=none; b=am4wovzDBrw9+OoMUevzrzEeBGjZjxMY11GeB1oWGJA3S7phyy8xzfHX0Q+GhLDQXFw5YY3L0J5lST89kfXbzaMGxM++qSbV7QRE0piSjWsaFue1PLVouhrnaZzQtUaPshAQbm2r5W74xsgNXbD+jA/6NAgfHIhxlP4Hk43R2YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780317585; c=relaxed/simple;
	bh=fB0XkuGEtU6/9vgXH2xIWZ3IP1PsZzEwBn0mMFAQBTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FFy0quShmwCY1lr+4Cc7C/um15nFykpBgqYMknb95UmSqafPInF1jZDOnlwp2taMBWa/i5D0RYfB4vLF47ARpbc1Er64pRpQ2CEaEa83ch/7/lbjBeEMByQlxzONf4DRA3Z4G/AhpyeoeX/vFkDOOdcTHmieMVBzenb/lwjt+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZU2OfvIG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZU2OfvIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780317583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WmB1fssVcWQrJg6zd/ODLvwAzXBTPjvao4pMKJwoRy0=;
	b=ZU2OfvIG2IwPbrQRWm/1UymyjJGchi8QmJm+07uxF7wOtpF91Ae7Mjz0fDSgbcRigH6UxZ
	ZHOcuxYxEveGhX3z3ctMCVAa3jgkIbr7SxeLb8w05V9anbKain/C3Ipk9/id5Sta+3/mP6
	M0oJkJAGLqEgkpUszdUD6WuFf6GVKPc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-eebfncabNQSvw83VexM95w-1; Mon, 01 Jun 2026 08:39:41 -0400
X-MC-Unique: eebfncabNQSvw83VexM95w-1
X-Mimecast-MFC-AGG-ID: eebfncabNQSvw83VexM95w_1780317581
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-45efb6e60e4so1485292f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 05:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780317580; x=1780922380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmB1fssVcWQrJg6zd/ODLvwAzXBTPjvao4pMKJwoRy0=;
        b=e9gAegUSW80xlG7VcP8aHnChwAxuh9BPKstz5rN8VBoiTIMe8dJBhfgvzKOU1XrTIa
         moxrk14Z6bMjrD485H0wG7Orhh8fsHkLeTx3IHJ/u/Ntw++5sJxJYqqFn5KgXS79rNNr
         Ft4Jan/p9S80EyDXami6WNjHc1MTFPmPchQfeap5QhHVdeBjDkD6y2OSk2lmnjipme9l
         VG0L7KB2B34Xh6NuMFxO5hrfxFKC7EnQOlVedwuZYyMUx1zqrNBO0zrbDuodFBZ6guFX
         qlIX/tUOhA2BFsHMOBLHleAl0fOW+G5IaHtpr+7Bf7ppT+yxqGIZkoNKK+ll+UMNhY8v
         VJTg==
X-Forwarded-Encrypted: i=1; AFNElJ/xIVXGEB7ksZZC0Ia9e1UDIFCHV697rdjlo7XhtxdmfoaN+HGq3UywWwOX8/etqLfNylYs54ty7uNutDzNSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9eG9y5ffK/91jNb+ddAOzFQv1aBtKPE9Y8XzKpMr7JEdrZbB7
	ZA1vAGDa/rFamBlDtE5r+5yE4vjT95H46IV099I3xzB5g4eWqMDVEqSnuEp96Fx9cWl4ZYp7Glp
	tMWpxYeeZEHrgwxRh7WxpRSu/ZB9PSQH7kBKt//FnAWU7GeWppPTLf7sh0YFwkljR+TqW
X-Gm-Gg: Acq92OE7Qvi3o31uOpvnjor6x2TJNsoirW9323ccRar3yJopPVGULPgC05y0UyHyVMw
	RJlqEOtJg5+PAnm0tmL1AF94LFGLTbF+bk72OKyZUJLKpZBR2HEr3qpnWfgWv4MRblW7gOc2VFD
	p7BPwN1+zqT2o9NmZvlW+T9fimTbQ4h84N7g8draozNmhUILZ8ZhiNe9yujdMMjxhNcKN7USnm7
	VGriC/HeLY3kErbxx7HqzBx7go5qMclqaXEkz+lSHwnlERPrb8Od+RdGfdq+rPE46kZ3bLO/iq8
	oLQuzXnV0qRkPSEEagto2GCZc4NGFdtEvPidTYoIeiZS+aDJR/YzvaT70yhRX2WZijLWdYBSBDL
	tsQd5xK1embEy3QuF02k2O2qp/K5gKFDqeRkGO0UM1xJJrIG4KDk/4A==
X-Received: by 2002:a5d:58f6:0:b0:45e:e50e:3bc with SMTP id ffacd0b85a97d-45ef6b71573mr15860101f8f.29.1780317580327;
        Mon, 01 Jun 2026 05:39:40 -0700 (PDT)
X-Received: by 2002:a5d:58f6:0:b0:45e:e50e:3bc with SMTP id ffacd0b85a97d-45ef6b71573mr15860036f8f.29.1780317579786;
        Mon, 01 Jun 2026 05:39:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3563cb9sm26259386f8f.29.2026.06.01.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:39:39 -0700 (PDT)
Date: Mon, 1 Jun 2026 08:39:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev,
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Alyssa Ross <hi@alyssa.is>, Mark Burton <MBURTON@qti.qualcomm.com>,
	Matti Moell <matti@qti.qualcomm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>,
	Vishwanath Seshagiri <vishs@meta.com>,
	Rob Bradford <rbradford@meta.com>,
	Zhengyu Zhao <zhaozhengyu@bytedance.com>,
	"Jorge E. Moreira" <jemoreira@google.com>
Subject: Re: Where should the vhost-user specification live?
Message-ID: <20260601083628-mutt-send-email-mst@kernel.org>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OH4EVUM5QHpkd2jatqPg5GEpX-OwmYo7-GcbNxwypc0_1780317581
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
>  But also because, in my opinion, separating
> the specification would improve development agility by decoupling
> specification development from QEMU's review and release cycles.

Generally for QEMU this will be less agility, unless I misunderstand
what is proposed)

Because presumably there will need to be spec releases then?

So
	new feature -> spec tree -> spec release -> qemu implementation -> qemu release

is surely longer that what we have now.

Whether there will be more agility for non qemu users will depend on
how often spec releases are cut.



-- 
MST

