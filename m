Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BAC19CD1D
	for <virtio-comment@lists.linux.dev>; Mon, 16 Feb 2026 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247769; cv=none; b=lo3Zw0vYdiCqogV0SyReOaQ5JF7U1ZiBpL7zL7YZ+hVv1nMcEoeK+p353HYI2rem4XxXsAEXbvRzMM9hWdqQhIstPeaNXnplowb5gCS0pbR2eeKGSBVxegwaJFFUjKmNIhHwGrnK6wCYMIqYkbkWxlkk+t5bNx3G9YOgo7Dg8p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247769; c=relaxed/simple;
	bh=TrvYBGeRANPypdvdZ/fTQ+XG3okiSOfN91cNOs6lPfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ceSOf4jI4kUMs31NES/2k0RefYl4EaD92wvPDsGGksqramrGiC3KxvHQLPR0hop+W/XiR6whGbrmRO1ksYIT84oB512c0dbqKjENVXziCJ3KOrCiMR1hqIDZVv1wKfyhBxo16UN9k1k2Wa6Tl2OLff2R9PM50rR+Fm4v5MdxLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WGntTZe+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WGntTZe+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771247767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0T/sSJQhAsABH8QyoGeO20JQilMNLkrg/2a2qm07nvg=;
	b=WGntTZe+euEU3GPo0Rmkrl/iANVvwV/KA7Fu9BVW0XqFH0qy0awuKgGeqGPzkjbcjeq59Q
	mfUP1YVtFjr/mpF8SrLoh+sio9qzFXJl8pzBAOxZfOTfZ4ptv+scj2Uz9CHHaeOMF4ULFn
	Pv1l3ZaVjCbau6SobDcf4SkSHtFtJdo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-C8mk0E_dMpeaGt4p2DWWdA-1; Mon, 16 Feb 2026 08:16:06 -0500
X-MC-Unique: C8mk0E_dMpeaGt4p2DWWdA-1
X-Mimecast-MFC-AGG-ID: C8mk0E_dMpeaGt4p2DWWdA_1771247765
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4837b9913c9so14938725e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 16 Feb 2026 05:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771247765; x=1771852565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0T/sSJQhAsABH8QyoGeO20JQilMNLkrg/2a2qm07nvg=;
        b=b16ON93KvN40fhkENg60ogLfN2uHqoKlgfiRG0enk3apeikwB/jG0f2gRttikUlmya
         2GVj/IAI+XIoqSDNteL/rBm/hQ11d8Q23cfWwge6jHBg12fIztDKWzeeBH8h8sThSREO
         pCp0EwuuJseEMhzmkpMWHNu5PcVtw8kuC0UYoEP7RFTWFSHEVrFWlXdRyrCUnTBxvvLs
         1d3HUvCQL6RmIii97jxmAGuBpgHp+//doGdW8mQKuZg4HATvGwrfY4EOCAwzsL0D2DQU
         7GfqgnZK8Ut7BOdc0Ui6e9LbJkO6l1UhApRgdjMySC78623dKyP/hNnKqFkR9/hSj0ZB
         qmWA==
X-Gm-Message-State: AOJu0YwyuW95ry2+i0KjBSJtlaZ0sXdRHowyDKix+fwJ15ypzi8Nb6MO
	Aogu2mHi7LRmfJjhtzJiD+WVPh5c0oNr2MM2q9JIkJ+aWMyUBUSBxPwy1SjML+PYcVa6lyvJnLJ
	1CogT3GXRfjGX4WrocDCP5yLJDsJ5PgfQHYvd6H4oTZgnrXcVTy5HV6WZ9ZQnN1CZihpCaeS6BM
	gPDvXjXDXShPlxRtShSD/NcSZqKpnBmRnvWRECUF2Ml2i5+Q==
X-Gm-Gg: AZuq6aLvwUb+SwPq1hm0YwHH3ZweAVPGf6Jag9i90Oe0rJ2By8QhYZmc5ZEPmUeFi3s
	nZDW18b5okJsT9+Xmi4Zga7QSQJDp5Ko0tw2KHpcb/VHzEPqtu7okHFJHgViqjjiB6uFt3So/YL
	cadC39AahAIRODQKVpUKc+hScT45US0CPx+omaE/ZzyA338+a3K7cgFRqMJdNcrkLTxudhGAxwR
	WShAvN/0xeSxt9ieBqRv4T0jl7bT1dOlVvQrO4XkkEjbIFNdIOg2oXaVIUapZEl828zPl4YJ87d
	ZquuhQIJliyFQTCAF0Am9dL2DfgL1dFUheObIV5YMW3pvYj9mo7p9LnpAxS86CWYlqCsBLiTwyY
	CeW1fjwbJHw30dJzweshKSMqhKBb6jpBpTvAc9HS9s2VtTw==
X-Received: by 2002:a05:600c:c108:b0:483:78c7:e1c1 with SMTP id 5b1f17b1804b1-48378c7e1d3mr119952275e9.12.1771247764740;
        Mon, 16 Feb 2026 05:16:04 -0800 (PST)
X-Received: by 2002:a05:600c:c108:b0:483:78c7:e1c1 with SMTP id 5b1f17b1804b1-48378c7e1d3mr119951675e9.12.1771247764133;
        Mon, 16 Feb 2026 05:16:04 -0800 (PST)
Received: from redhat.com (IGLD-80-230-34-155.inter.net.il. [80.230.34.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a21cbesm126759905e9.5.2026.02.16.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 05:16:03 -0800 (PST)
Date: Mon, 16 Feb 2026 08:16:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [oasis-tcs/virtio-spec] Missing struct definitions in GPU device
 "5.7.6.9 Device Operation: controlq (3d)" (Issue #239)
Message-ID: <20260216081453-mutt-send-email-mst@kernel.org>
References: <oasis-tcs/virtio-spec/issues/239@github.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <oasis-tcs/virtio-spec/issues/239@github.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7sSKnq5op102f2i6m9suJvCG0n0fayGex6QL2FDWP7k_1771247765
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Feb 16, 2026 at 04:36:00AM -0800, Manos Pitsidianakis wrote:
> ●epilys created an issue (oasis-tcs/virtio-spec#239)
> 
> These structs are defined in Linux UAPI ^1 but not in the spec, is this an
> oversight or on purpose?
> 
> https://github.com/oasis-tcs/virtio-spec/blob/
> 1ba6e8108644d598cf9c772bac7b856fb5c7df6b/device-types/gpu/description.tex#
> L752-L767
> 
> Should I submit a patch to add these definitions?
> 
> Footnotes
> 
>  1. https://github.com/torvalds/linux/blob/
>     0f2acd3148e0ef42bdacbd477f90e8533f96b2ac/include/uapi/linux/virtio_gpu.h#
>     L296 ↩
> 
> —
> Reply to this email directly, view it on GitHub, or unsubscribe.
> You are receiving this because you are subscribed to this thread.*Message ID: 
> <oasis-tcs/virtio-spec/issues/239@github.com>


Pls direct all spec comments to the virtio-comments mailing list.
Sending a patch is a great way to start a discussion. Thanks!

