Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653AE3603E0
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874335; cv=none; b=bzUrUiI0kRHtw9D+TsYHUwlWNG9U8I0M3wfJT+a+VeXtGsK2EAuvhikCQfuIa30xOe6Ftcc4CtJFBcQELiNQUT8Wnczq33ywIEG3gJiPmFIX3pVRb6lplhmnEonNgeIT3/cTpYDYKuKbxc+Mb/oJbFeZts9WnjKnCxqC+xFoJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874335; c=relaxed/simple;
	bh=ADC6EYU/tiy/YTxJHSUpX24PJiaiHnqKZQyAjB34fqQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G6ydUYtbVEyQn/r5LHM/xdgL7ZQtoKE9qjwXpl1g5HlosurP8phJsoUqd4kGICplTH87p/u0h6Lmw+UCqn/0gjV38joOKPue3K3F5GgOnCs1d9dvlIuoM7yE4Jg1OkIqHYc6goxsOi0SshQIie5iKM6vWpn4yZgPagWtJwsywRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rh8uFu37; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rh8uFu37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776874333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=YEmY+YP+cfwCxFrzpPGa8E+VAd6KpeFnmikjQmTxOt8=;
	b=Rh8uFu373aQizpxHNeT17E2Z+j47RuATxed8RqlW3fHH+gnXp8SWuAqx2O5xGdt0gNjCE9
	zAlKm29kP9jh5ZBfeCpABSV5NnFXZvJVEHp0PXLibePFfmh78lJBi7IMtUEtijhgk1H/h/
	Z1SPTJzy3gSs1FU3YRJ8Rwscj4TPrec=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-NUk6PYFIO-SbR_ZJ_BAb-A-1; Wed, 22 Apr 2026 12:12:11 -0400
X-MC-Unique: NUk6PYFIO-SbR_ZJ_BAb-A-1
X-Mimecast-MFC-AGG-ID: NUk6PYFIO-SbR_ZJ_BAb-A_1776874328
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-488c768a9a9so41676695e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 09:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874327; x=1777479127;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEmY+YP+cfwCxFrzpPGa8E+VAd6KpeFnmikjQmTxOt8=;
        b=aaiRtBg/3YbyVQ7TKESj7PAp7xlruCtFbYNqFV0Q9GB2ehlEcySTTfsJEUIrfIerNv
         Xb5g2sa3vd1f164gpgkdlDHxw6WFDnZqOvJMgewwowodvpi8h9T/nOG0x2ayaeaw5zPD
         ELCx6hO0/oWcDa1SRuIIutKJIWYqY2pir/e+0E8xPcjzhWYfACENWNc89WRQkAFmPwm/
         XB/Qc9evVL6ImP3NHtXFtfpcfyDXt2hMYtitHr3HATacEIwQK044fUAmGtbJmSeSESzm
         /THU4UFIFL0zJPOSs/l8ZLlNjhbiNxs9Fgz1a06KpRJaNIP5EoxVF5GWOGJUjLRrXRVb
         uaAQ==
X-Gm-Message-State: AOJu0YwLlqGkkhRgS6x3wadEt42A4kCW/44ShTcWjaXNxqNVbqBpg96Q
	M2QC2xCbnhgHBigpctjBWTvKySeIP4eiF/tKnBmWFMdajO94CsqkbHLIwJ6jULjDyR1rpPpCb6Y
	IbR8uYBUHX4WDT7dDv9HggnyM6uiKqsufehErqvaFIutzTp7JZ+KLxFErPPnN4RX3GfkLoe0DlB
	zxp7+kKINzCNMQj99KQaRGW8A5EogYq4zKVc5lCVxtXgdeUA==
X-Gm-Gg: AeBDiespzkvD3QweEf0pZu8RF1Tcfy2UVJN15TaqWgD8aatfJ+MnWK9gTS8hUz6Gmse
	vDzkIlkq/aMdEfZMTiPMJ7ChxVeR+yg4yb+kEEt9r95oLaJeeEUCijcN+g1ofum6CDQY6HCkMUW
	O8uD7/cKyhp2XnoP4ebIvXGA6GXT90VWsMyCAE4uwrhs4la5pcPr1ermw0tF8OQZFNeaZjEt8gK
	QQ1L50g/NN6SP3KLn6MBmNWHntGr0OmD2vZiT60wCIGXyyeqBmhSJELHfBZnBQmbb4GgS7xI+hG
	C7SzFLs9tf8amjahLe73O3o7FsPAWbdNjGhPhQUl1MOim/D9P0YAdEkKUSc/QB62YPhT7096l64
	PdP88URiexGuDyUqCJe7ct3+z33EQEu7DE8+bfqXu0yPNl3oN09PPCQ==
X-Received: by 2002:a05:600c:a103:b0:48a:58e1:6d17 with SMTP id 5b1f17b1804b1-48a58e16ee0mr63885385e9.20.1776874327195;
        Wed, 22 Apr 2026 09:12:07 -0700 (PDT)
X-Received: by 2002:a05:600c:a103:b0:48a:58e1:6d17 with SMTP id 5b1f17b1804b1-48a58e16ee0mr63884735e9.20.1776874326636;
        Wed, 22 Apr 2026 09:12:06 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489207ebd3asm105393815e9.6.2026.04.22.09.12.05
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:12:05 -0700 (PDT)
Date: Wed, 22 Apr 2026 12:12:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 0/2] support device init for balloon pages
Message-ID: <cover.1776874126.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 748fntl7K3zjj6lKrEr5yPqvlNi2kRe3tsaxc1gdbeg_1776874328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Once a page gets out of balloon (on deflate, or on access for
reporting) the Linux guest inits it before giving it to app.
It's a waste - the page is already inited by the host.

Add balloon support for skipping that, that provides significant
performance gains:
https://lore.kernel.org/all/cover.1776808209.git.mst@redhat.com/



Michael S. Tsirkin (2):
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_DEFLATED

 device-types/balloon/description.tex        | 108 ++++++++++++++++++++
 device-types/balloon/device-conformance.tex |   2 +
 device-types/balloon/driver-conformance.tex |   2 +
 3 files changed, 112 insertions(+)

-- 
MST

