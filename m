Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDDA4502F
	for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760511726; cv=none; b=HC+3oCB2lsQ6bvPXV/ef9TruG9rhcL0tef+KJW7BqYYsej5rWI9SpFI2tPwbFljPyauPe82OPU9BNkAavyeFDQYlsJMo31VqdB2Z2iaTq3gJ/6+gG1aW3/WRO3J9BOA4FfpgRuCVEUns8wdHiNWvet9W+JG49UiiTTgIN/9LAVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760511726; c=relaxed/simple;
	bh=4IwepC3h/i6BpDFu9V4LOmmiwYdtyedtCQHIXTXilmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lZiUKu05pMaPK2l2wpSmRqgYZVEcL0JuKj84esWBXO8zS1VTJ9quzsE97oS6furfqAaf+NngqUjHWem4ijcPnNlbBipgB+9hxAdAku1z+Tj4VmccDKkFy45ot/D+N3zRg9vviot2Z+uQHCC3mHFR6TRLMOHRxZK/rcrbC04dgrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y96TcR0J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y96TcR0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760511723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hd7Zvcht2tbRptN51YhnGU7qOwRg2WHrmQE3K6Qqc3g=;
	b=Y96TcR0JYEMevdfRJiv417Tf7wwB3Dy91mrfB//5rWpUS2dXmOX+bMx8Se4islHdj9ihpt
	8yK5l9WD60BgVThn2MHmeUuNMWoBxPAFmpU6gLUSQbGhZQezTzZFsutri6VvdkG0IL0oDI
	4ljhoc0pxy5yRrPEEsrxeNA3DbeHMlQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-quFmu59wO1WtFzrYxyskEg-1; Wed, 15 Oct 2025 03:02:02 -0400
X-MC-Unique: quFmu59wO1WtFzrYxyskEg-1
X-Mimecast-MFC-AGG-ID: quFmu59wO1WtFzrYxyskEg_1760511721
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-470fcde7fedso3439545e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 15 Oct 2025 00:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760511721; x=1761116521;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hd7Zvcht2tbRptN51YhnGU7qOwRg2WHrmQE3K6Qqc3g=;
        b=L7cEepyC8kdJ5m//shsC3xsuxP+H6+EEdf6x2t84bAmIhmej1uEOeUKPwuubzb/yXf
         3RkwhCc9cb4pyccwbJ60WVdOgUTYmGGErEcXgAtmwCz+L9RfCAzm1pPsIBa2VEGdGHfU
         FTk6xbLCPMuOIkSn2FjMQet/wqb0qKy9xJoHKPCFlGi0WcNKgW5LudmCctJbf/eXmhAd
         CHkshsm2YUwvrnQpE1/eaL4MpkYrmlXNW1B3LaGU6OHDwP+QZHfdU64RCNPoFMtgHBcQ
         5EIT/Ei50vhYiGr6qQJuwXCb095PtQdV1Ta6SQqW1eID8Bps41YLzNSzP1UwmgIr4dFD
         oqUw==
X-Gm-Message-State: AOJu0YwKMGfei0XoY/lduuF4e9fi6gjJE3T/mWk8YAmWn3EenV/X1lYt
	o2apcSd3M6X2Ftu9CNN869WnEtJtKn7hTRXzCM7/ToSVjiSx3om64Opn25s5N+skOETuzKkG6vx
	TNw5D4pawD3mgNL9N/7c6RdVd7wE2rouGPJHewXvvB6MQ1urUWQea+NIqy/Rq5E0Xju1v
X-Gm-Gg: ASbGncuIxgXW/B5JN5S5qeQY/nFfhZoNZpeBdVJxg8sU3F7K4wK7TKxquDjSg05J3Bp
	NxZ5GxUB0FnDd0SHNEi/L1Y1YEOWckJjWJRqtRU40FeoymN8Mu+mXtICqZ+X2IsuQPneu3f++j1
	XChyWnsIBEQz84ib9uoz/WU3KLKRT3kjKKIzG4m29cBcMQpAXO095kLsqk7uvb8tKq8S+bLLynR
	GxVioiUu6biC2wfzoQhm1BjiMYPQNRQyfRU10b73/54ucchrVTfA3r1ZY9V1DDB54TvI012z0ol
	6eYeUDppkSYSivka8nmoK1TkQGb+rjpMCg==
X-Received: by 2002:a05:600d:f:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-46fa9b9a84fmr152748065e9.29.1760511720545;
        Wed, 15 Oct 2025 00:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsO+5NzvST25rcPOqznMZPqpw7A862OWmVcUdSnqpkp6P2yt9P+T9GRz/fcCPqvfgMayTJrQ==
X-Received: by 2002:a05:600d:f:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-46fa9b9a84fmr152747785e9.29.1760511720073;
        Wed, 15 Oct 2025 00:02:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5d0061sm27361673f8f.30.2025.10.15.00.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 00:01:59 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:01:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, lulu@redhat.com,
	nguyenlienviet@google.com
Subject: Re: [PATCH] virtio-net: introduce TSO limit feature
Message-ID: <20251015024018-mutt-send-email-mst@kernel.org>
References: <20251014042243.22087-1-jasowang@redhat.com>
 <20251014044005-mutt-send-email-mst@kernel.org>
 <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEs7Y9DLuRp_3ex8ac3Hv5y7X5Q-PnS61DMjOVjAkvazjA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l7sxpLcN10fp7h0k_Ece99aD-RvLXUqTDmSU-j3wPfY_1760511721
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 15, 2025 at 12:29:13PM +0800, Jason Wang wrote:
> On Tue, Oct 14, 2025 at 4:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > thanks for the patch! yet something to improve.
> > I note issues only when encountered 1st time but please
> > do go and check all patch for each issue.
> >
> >
> > On Tue, Oct 14, 2025 at 12:22:43PM +0800, Jason Wang wrote:
> > > This patch introduces TSO limit feature which allows the device to
> > > advertise:
> > >
> > > - Maximum TCP length of a TSO packet or inner TSO packet when UDP
> > >   tunnel is support
> > > - Maximum number of segment that can be produced by the device after
> > >   segmentation of TSO or inner TSO packet of a UDP tunnel
> > >
> > > This is a must to implement TCP jumbogram, as networking stack needs
> > > to know the limitation of the device in order to produce TSO packet as
> > > large as possible.


Maybe you can provide an overview of how this all is used?
I am looking at tcp_fragment and I just do not see
where it looks at any device limits.

-- 
MST

