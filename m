Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46436998C
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319497; cv=none; b=At8H4hmWioH9FWQkz2dY4o33c3LQvm0QfeeM7eYCTZd8+26omyasvoipecBHS5bZ8upobjod+o1n4+bRphNm2LhmiB9HLMA7Mcx2JdODmi72txUJocrYdDp/35juV8DAbG4MDEhB3SQ1Jaaqu08h2M+rdCV8z/ZpDc88a2Bbh28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319497; c=relaxed/simple;
	bh=XHH5I/KJfQqrZ0dB9EwmuPL6rfpym5BUpzMLfe3GLj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mDWSg0dt6Lu34Ar3eNlef6e7SZsU7SDC01/IbN5fmVygMBlI9zlmBG5ut1x3FFTWuN2T/2Mrk2R8bH2aa5OnCyiJtsOGN0sogFMrqsbhwLpGAGFb80J2BSCIDSequKjS07CCoIeqxbK6gfQNzbHKEB7iljIIhmlj4Jgqf/gJVuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hSu9BJ46; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hSu9BJ46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780319494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ECHPmOAKI6Nwk0NjCQ/5FeLRB8gynrXIGdywqExjSo=;
	b=hSu9BJ468uW9xQBlaap9YnkPpuPhTksW7o0/pKqKEuSF7YzVEIqVun4oRxeWZrgsraQJGX
	saUpXsucn1vnb9sHa+AULOcBYarQQf7vu1Gwns1pL/JqKcadF/ZvjOoO4svI9u2jDhW8bt
	n7u9OL5NfQOjGcTIfm5Mio/hQkZoS/g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-XC9GENv-OwS8ViNEZI9PsQ-1; Mon, 01 Jun 2026 09:11:30 -0400
X-MC-Unique: XC9GENv-OwS8ViNEZI9PsQ-1
X-Mimecast-MFC-AGG-ID: XC9GENv-OwS8ViNEZI9PsQ_1780319486
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4600cf05f07so1073783f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 06:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780319486; x=1780924286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ECHPmOAKI6Nwk0NjCQ/5FeLRB8gynrXIGdywqExjSo=;
        b=DsT0BWbm/pwO9TId9uGhvoGxkrIa2cSzNvjkYHIY468009WHo9FFQCGCGII67qjCNu
         YpIQfLhaS7lr58rGWVcGWhCO+F/s6mNIM4KjVWlVmEcCx1IZ/MeVRwirZeJrOELg8KQz
         hevVFUx0o/uI/QDSAYMKHOMTh+ueX8HM7LoOPLXxXjEzPVERCihEaSsHmkPVBoHg3YW3
         QQ/YkwFkZQ7rpbXGouUqXOEUw+RF98n80kRxSjqoyS8XnX48ordcjIIKryH0HMYm9YnC
         joB3HDyUe9fmtuCh2SKREue6/VNL35WmYvFaYgubDzk1CJlRaDh92z7ZQQew+/Pc/NHE
         8zTA==
X-Forwarded-Encrypted: i=1; AFNElJ/xU22Om9NZcJwz2UrEC7m+a5yYtGgg6w/xTolxlGqlhEsJhdjnIS8N9rsaGK4L8qW2EEQXItf7uuuP64Xnxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy95pRXpU80g6CBc7o5zyTH5LbsqH7IyH7xH0qSpIY/C9Xv7aq/
	FE8FziTR3XH/fHTvAxXEg1bov3gOdOQHWvJh/AXxZjrHUQk/OH4/cOvekgouzxRsKgKsj9PCw18
	Rk/g3nke0esDmlgCUInvpJBE7XmH6r+o/KSWR/Gtc1rRHYQv1CvABfNJ+QVj59NzxpTlN
X-Gm-Gg: Acq92OEGqCLAmUjBwQ0SAExI11WSWomQlp5rxBoaPUAKHBTYWashTMKVsaYZldi4Qoe
	lBiiMCyT7SYtDMCB+WmflRA2Jy+7A/mlou+u2YcyPFmeRQHqhw5vE/Pdi1Mg/PXGkuPR6tr2UPF
	Dg8MoOM1A4H2Uzs4X3x81boP3wxHsHJ67hbRThWZcwHOZ4MjswEYyHAQSXESAXbjFHjVESKR+WG
	npolKxL3pWOlzwO08sXue12LW/Ohp6uaRfHwS7mzl17fIVw0ao0FNuwNg5Y0z4lUbEwFlkSfXwh
	Ou7QInv+Hv2oCDptmaLsjgCftX1BbeuMaQu4gMHvwFbAug8HMVhsXSsRBnIpa+IYyOFwmGKe6h4
	4sjsrjwcilw19vxp3FJ4E+DU6BufKm28bpVP6uZFJ/ni+nSE9vwb7fA==
X-Received: by 2002:a05:6000:4610:b0:45e:db3b:921d with SMTP id ffacd0b85a97d-45ef6b67882mr21226127f8f.31.1780319485946;
        Mon, 01 Jun 2026 06:11:25 -0700 (PDT)
X-Received: by 2002:a05:6000:4610:b0:45e:db3b:921d with SMTP id ffacd0b85a97d-45ef6b67882mr21226068f8f.31.1780319485453;
        Mon, 01 Jun 2026 06:11:25 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm24599676f8f.0.2026.06.01.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:11:24 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:11:21 -0400
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
Message-ID: <20260601090953-mutt-send-email-mst@kernel.org>
References: <874ijtz038.fsf@draig.linaro.org>
 <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
 <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B4GzW5830yzNTasECxH-FDH9VlbCUIMOSUDPAwIaMt4_1780319486
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 01, 2026 at 03:05:50PM +0200, Albert Esteve wrote:
> On Mon, Jun 1, 2026 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
> > >  But also because, in my opinion, separating
> > > the specification would improve development agility by decoupling
> > > specification development from QEMU's review and release cycles.
> >
> > Generally for QEMU this will be less agility, unless I misunderstand
> > what is proposed)
> >
> > Because presumably there will need to be spec releases then?
> >
> > So
> >         new feature -> spec tree -> spec release -> qemu implementation -> qemu release
> >
> > is surely longer that what we have now.
> 
> I see your point.
> 
> However, we do not really need to introduce a heavy release management
> layer. We could just operate it as a living document, where the main
> branch is the authoritative source of truth.
> 
> For the workflow, development doesn't have to be strictly sequential
> either. A contributor can propose the spec update while working on the
> implementation, much like we do for VirtIO updates. Actually, this way
> one update/change supports the other.
> 
> I guess my point is that a dedicated repository could lower the
> barrier for new changes AND keep QEMU's own development speed mostly
> unaffected.
> 
> BR,
> Albert

Something something submodule? Possibly. If you want to make progress
on this, pls think of the process, try it out.

> >
> > Whether there will be more agility for non qemu users will depend on
> > how often spec releases are cut.
> >
> >
> >
> > --
> > MST
> >

