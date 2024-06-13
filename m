Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7376C144317
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288144; cv=none; b=jJHjWsxFaVqmu3uqQ7n9XQtFJhyud63u+nretQxSjuPhwp/w1jWyO2gwpDFSKIsodPkcvBZpwTi3N3RRI2H5hyGHCxHVkirY31Y57yx31P9mxmYCST2u1WIMUsAPPnDwtVx6OcAmyXwgqjkbqnb1FDNxBYDdbtEfrU09Iix6La8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288144; c=relaxed/simple;
	bh=OS2CN0Al6IIqvdG1duwgIsim2yifiAdY2UJBF9FQbto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VojDeTPQOk7G6tTEnreJyBIdSUpeXP1Q3o/UJcIWO81VnZcGq01PhwQHLGOowUpRyWHxQEMSB0ryl12r+e70ZeJnnD0mOlAQDYbir3j/z1M//3IB9ok4NQAG0Y3a+U9/jRO46IuU9mcTzeK2zAZr96QQk0wZg0jnkIMC2BCjw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOeS+F9N; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOeS+F9N"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c4af25f7d7so926582a91.1
        for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718288143; x=1718892943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//TxveCEJIrkR7ClecQRERNaUSNQzW/5Y98Qj49KHNM=;
        b=ZOeS+F9NVJD/jCZDf1mc2ewrRUhsNDwvqsqoHBqF1dmpDzNFDZcB1jiVOMZY2JRbD5
         8+jUIFhr4hgoDJx/5JqBLK4EcpDLLzihlBDv8ewDapjjEwI1FjQ/RFBwgxiCXxQXAQMu
         OhZBGPDjxzoawg//qM0/E1bqsLf6Ei9zaQ/w1SCk2AVaVDMZ84CDlwVOE+eZvKjKz3pq
         uaiv5qfZZeCuqkDDxaz57XMVTWE8lvHlbzPhv9se9cLnIharT6rIBq/076/J3eIomuer
         Mx7Q3lomPNa/6ZR5pEsaVJxhiajD60PCRdjzcwq70F2xlkUGpOnciLPK/s6i+421kL9N
         jOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288143; x=1718892943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//TxveCEJIrkR7ClecQRERNaUSNQzW/5Y98Qj49KHNM=;
        b=SaDFSKhEFbRMW8eLjrIN4fvsjF2aVzZNFTMSP2yJ3CstgRf0DpoF8p0VUHtS5jl6H+
         Mbxv3o2JyFXd79KWCsFqZX1bGAvl/mMZQLQ2jPJqjkSQ6ncfWNXncsc2Pu3nvMR+qCV5
         tjX611MwQE1zYYVnehRSRE2k3wIEdGjG0sj+O2c1zlnEgO2/ACrcnhI6sio3ijIchoa2
         KRbwYnHrNOG9Bn8OWT7EgqiOEMItVHh2mmX4iWdvFvfOnpuYr/g1ZXKEikl7XEHJ5iWw
         /I8TcjkUub4q2skRjhuTVNXBhKMt5ErK6Sg/xbtAwBMNSw/sMUJmY5hXMeO9WKX8H4Vt
         3nCw==
X-Forwarded-Encrypted: i=1; AJvYcCXBrKqXcPLTerefuWF3eVNmHr/H4H1YS7XbvI9EgVSpp5uQG04s8fq+Ul0b2xi9Ie0JRZ/D1emECE85wx/huLy6Ma3/eRpgow8OoxSQJfo=
X-Gm-Message-State: AOJu0YzN5rYw47rDuFnl269Ep+zrtasab9F6rGwAyj3Fo8znbGa07KJh
	DyI0sefSv3HI9HHpEyQwcOAWsesnNFG8e8aeoFL1gs8aFIjFfk+2
X-Google-Smtp-Source: AGHT+IHGpJUWoS2h9EUcT7X2TAOKjCht9meSN+sqc/OvyG6RGyhCxLNJq6eE1XsOS6wBkKki3RPefA==
X-Received: by 2002:a17:90b:1d0d:b0:2c0:76b:f466 with SMTP id 98e67ed59e1d1-2c4a761b25dmr5350819a91.5.1718288142631;
        Thu, 13 Jun 2024 07:15:42 -0700 (PDT)
Received: from devant.hz.ali.com ([47.89.83.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c45cc04fsm1730544a91.21.2024.06.13.07.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:15:41 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	hi@alyssa.is,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	virtio-comment@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] virtio-vsock: Extend the spec with an `order`
Date: Thu, 13 Jun 2024 22:15:28 +0800
Message-Id: <20240613141528.2585617-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4vi4tpunqv4lx3odqgjxcb3lgu2nobqarmsugt3i2s7nhonjrf@2kjhzmlcyibj>
References: <4vi4tpunqv4lx3odqgjxcb3lgu2nobqarmsugt3i2s7nhonjrf@2kjhzmlcyibj>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >> >> >Add a new field, named `order`, to the `virtio_vsock_config`.
> >> >> >
> >> >> >There are two questions about the field that are valuable to discuss:
> >> >> >
> >> >> >(1) Do we really need the `order` instead of a `default_device`?
> >> >> >
> >> >> >IMHO, the answer is yes.
> >> >> >
> >> >> >The `order` is more generic than the `default_device`. The device with the
> >> >> >lowest order is the default device. Moreover, the `order` field determines
> >> >> >the sequence of devices in the list. The device list is the same every time
> >> >> >the system starts.
> >> >> >
> >> >> >The device with lower order means it is more important. Also, it means it
> >> >> >has more likely to be used. Those devices are placed in the front of the
> >> >> >list for performance purposes.
> >> >>
> >> >> This is an implementation details IMHO.
> >> >>
> >> >> BTW perhaps the biggest point in favor of `order` IMHO is the fact that
> >> >> this works very well with hotplung/hotunplug, since if we add at 
> >> >> runtime
> >> >> a device that is to become the default, we don't need to change the
> >> >> configuration of the previous device.
> >> >
> >> >I'll rework on this. BTW, shall I add this to the document? Currently, they
> >> >only exist on the commit message.
> >>
> >> Maybe yes, what about adding a new paragraph to describe the
> >> multi-device support?
> >
> >I'd like to add some descriptor after 
> >"\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple 
> >devices.":
> >
> >\begin{description}
> >\item[VIRTIO_VSOCK_F_STREAM (0)] stream socket type is supported.
> >\item[VIRTIO_VSOCK_F_SEQPACKET (1)] seqpacket socket type is supported.
> >\item[VIRTIO_VSOCK_F_NO_IMPLIED_STREAM (2)] stream socket type is not 
> >implied.
> >\item[VIRTIO_VSOCK_F_MULTI_DEVICES (3)] driver supports multiple 
> >devices.
> >It allows to enable multiple backends, e.g. virtio-vsock, vhost-vsock, 
> >etc.
> 
> I don't think we should talk about backends here. We never defined them 
> in the spec, and I think is out of the scope. They are just virtio-vsock 
> device implementation, so we should just refer them as "devices".
> 
> >The isolation of virtqueues benefits from this feature.
> 
> Let's describe just the feature and how it works.
> If we don't want to add a new section, maybe we can describe it a bit in 
> the Device Initialization or Device Operation.

Okay. I'll add some descriptions in the Device Initialization.

> Also, maybe we should merge the 2 patches in a single patch, since 
> VIRTIO_VSOCK_F_MULTI_DEVICES is useless without the new field in the 
> config space.
> 
> WDYT?
> 
> Thanks,
> Stefano

Sounds good to me. I'll do it.

Thanks,
Xuewei
