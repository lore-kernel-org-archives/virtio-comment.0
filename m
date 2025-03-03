Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2F2147F3
	for <virtio-comment@lists.linux.dev>; Mon,  3 Mar 2025 19:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031992; cv=none; b=t+RX+AjdqpEdAVEKuLxS1gL3fnIinmzzZ9HwyI2Emfjn1YzmpwxtYpwQM850TmUlWXiPrIyYNOlft7qTxARYlysw3KUiT7H7Mo9J5d1uUF7HmxzfOAUPkm48xj9RWiTH5OLhZndPGEkiRJBogNoh2XNSh0UUeGDfVuNqJW7WE00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031992; c=relaxed/simple;
	bh=T3Mjd8Tt3KOp11x2NDXH6eg4VCyDGAMc2vvzm/LUSwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WzqZ4f5J9bIouls1pRrM3se2aDPxXpalLud3pEgTZS6/Cxh3X49GH+HYHKvO53k0oHs7yCyJdc8GiZ3nIgMEKDggyGKSN68NWz9ejc8R1IBoqoiTiO5JsnNS9sBYmvlzGAtI7VVSC81JUP/kphBWodG5HdOWpX7wzky/UTZXMyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CdRbPbQS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdRbPbQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741031989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RjnQFCTSlB80I99+cYzZx4IrvKza/oWEcqC48rO1ovI=;
	b=CdRbPbQSojh0cGPmUW28yL4dZirqA+oPiyEfzqZSkBS+Lya3rNezF8iw9LV20OYx5BgVqv
	q1ajvc+iJz5xL+mvxCe8AOsP5SnVzQpslzbeQucu/re9C5OsOMhaeIYwNilF5w8yxEl/M0
	Nu/9tJBVGnDRghQjo3N1VdEml9xuWHg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-CTVkJHooNYiYXItvOZjF2Q-1; Mon, 03 Mar 2025 14:59:43 -0500
X-MC-Unique: CTVkJHooNYiYXItvOZjF2Q-1
X-Mimecast-MFC-AGG-ID: CTVkJHooNYiYXItvOZjF2Q_1741031982
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390f729efacso968704f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 03 Mar 2025 11:59:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741031982; x=1741636782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjnQFCTSlB80I99+cYzZx4IrvKza/oWEcqC48rO1ovI=;
        b=juCSqOvA2+XEpcSVWrTD5oqBNnVMYl5xvaG3Z2di/rsYuip1XeidPx0Ze7Q82Bluhy
         5q+giI1fdbXLCHd/czCLyfObsVWAjQkPt0Hl1zI3ePPqIkCLYXOToKIyP4CkS9FFIJVp
         B2Uv+Fm1lxCwWgTbXSZPjr+WUEqwyzDUOf5FPRUdp75oVY+8P3Pc5DAGu0wCQIQKT10R
         br2knUd3QfHiUAXpgdFmjrFhYngajJrnjlICunay39G9Neupv9PtFZgIScRBQYdGZenP
         3FjXT3hBVaJhIl8Xnz6nQmJ4n+gW5HvDlGgNSWTrENIoc+PqIpOXtIKg3S7Ta7qcWYDh
         Ewng==
X-Forwarded-Encrypted: i=1; AJvYcCWLJ4eOYCnwH6ARSakJo+fTNBSkb3Di+UwY6WV286N2PllfPdHN8DyvCzIH0dMKP+7Scm9E39WeZasbpWCAKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpfrVWbP+f/3k+b5PCzgRQVMGPijX70uGBNl7l9i8wmzUNf1T1
	hnVoKI88sdgliUuJNQjDvyuL2bjcf+FRJz/qU9HNrsK/KC39u4FBSpJj4sStGxZDGsGt0dHZ21l
	mYa++P/awXtbNKDAxaoWRzQ9oOEKuF4OPGcQqhImqteF/7TWKF9xe+OCAs799X+Mz
X-Gm-Gg: ASbGncskP/2LeLNHuD+mdxoRsPf3OOlBx/EwNBAgxX9Q4YgJs49X0gvG10Nbi1EH1ZZ
	Fw+oBIBH9ovHfrZFq0XUq57DKKrw4Bz3ftobUqQKUqfIIM/zrJkwcQrupzDzP27Kub1Aqm9mJgp
	/+dQCqTBgRFDclFLOScuzyrmXDyQm7UIyHdk3MtkVewvMbtR7cgYrhNxIET15P+wlCO5QiCx4/I
	SgUoJWFvg/GvYqWM9BM+6U1UznDcKnv+VZ1X1YMNrtqyAmpB+G4ijQFZk6dF2VrY1RYTgGAU7V8
	vntc1mJIGQ==
X-Received: by 2002:a5d:5886:0:b0:390:efa5:9f6 with SMTP id ffacd0b85a97d-390efa50b8dmr11563309f8f.51.1741031982215;
        Mon, 03 Mar 2025 11:59:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH60iVGFelcjN0BKvbiVsD55c72EnMdYs4lUHdGEwD5LMVNZmv60e0m3Cb2hN9A8kjItaLsTQ==
X-Received: by 2002:a5d:5886:0:b0:390:efa5:9f6 with SMTP id ffacd0b85a97d-390efa50b8dmr11563285f8f.51.1741031981821;
        Mon, 03 Mar 2025 11:59:41 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1514:ea00:6409:9e94:fe6f:3eb6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796084sm15658249f8f.19.2025.03.03.11.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:59:41 -0800 (PST)
Date: Mon, 3 Mar 2025 14:59:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Wei <dw@davidwei.uk>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
	cohuck@redhat.com, hengqi@linux.alibaba.com, sburla@marvell.com,
	shahafs@nvidia.com, si-wei.liu@oracle.com,
	peter.hilber@opensynergy.com, jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v11 00/13] flow filter using basic facilities of
 capability and resource objects
Message-ID: <20250303145911-mutt-send-email-mst@kernel.org>
References: <20240604132903.2093195-1-parav@nvidia.com>
 <691016c0-b8e4-48f0-a26b-45296102f501@davidwei.uk>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <691016c0-b8e4-48f0-a26b-45296102f501@davidwei.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e59Ffqm1d2wF-K72yndN9y7SHfmVZiAZG1Y7v-tSwv4_1741031982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 03, 2025 at 11:10:12AM -0800, David Wei wrote:
> On 2024-06-04 06:28, Parav Pandit wrote:
> > Summary:
> > ========
> > This series improves virtio net receive packet steering to
> > direct packets to a specific RQ.
> > 
> > This basic functionality will enable Linux ethtool steering,
> > and accelerated receive flow steering (ARFS) as a starting point,
> > and more use cases in future.
> > 
> > It is using new virtio basic facilities of capability and
> > resource objects described later in this cover letter.
> > 
> > Those interested only in the capability and resource object facilities
> > can jump in the cover leter to "Overview of capability and resource objects".
> > 
> 
> Hi folks, what is the state of this virtio spec update adding flow
> steering?
> 
> I added io_uring zero copy receive which got merged recently. This
> feature requires hardware flow steering and RSS contexts to work. I'm
> targeting bnxt and mlx5 for real hardware support but would also like to
> add it to virtio. This will be useful for VMs as well as testing w/o
> needing real hardware.
> 
> I checked https://github.com/oasis-tcs/virtio-spec but don't see the
> patches committed.
> 
> Thanks,
> David

Given no one objects, the thing to do is to ask for a vote.
-- 
MST

