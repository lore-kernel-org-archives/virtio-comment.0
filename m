Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B511A00FE
	for <virtio-comment@lists.linux.dev>; Mon, 21 Apr 2025 11:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233799; cv=none; b=XguLLRF+Mj+XFUzcj2AUgysvSaitgBXeoQGC0LNApKn9n5M7dgLXwQlLtgOPLt/bZqEvmeVoc+sJP3arsiLslk/N4iZ5Xu9809iklwjNzr3oaLtUYFt6xv21Y0P2tU6cULXsHVGhN8zmnnJDVJ50d19J8RXA/au48HebX0crKI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233799; c=relaxed/simple;
	bh=XgTwrepX8AnjOXQs8fr22cuhIkyxAKyJIAb/a+jqkos=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKIJFvhwTUGMBqk3jctKfbXTkyiPvQ0Ym68xNQzKmIGax8x2piR6xa4eu7KItLtgaNchmg4r+h5Eb/7dDa5zYugq5+V6paQ3AbVFaEt0FONMnM328wbRCBBJDLQvn0WMydE7seB8a3YRPGZPIOpj7C5ovVeNZ6P8v8NXZzHjZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRoIdmvi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRoIdmvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745233795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glPxpukmtl+ClcsknhBwuubnuKmo7/1epD20jjekMO4=;
	b=RRoIdmvilGUeD70IZkN3dV7kbqelmoOBM9VfONzdJVbn8lvaRZTXFu+WPQtzd2OmwF09nL
	Dw4Tn7OPfwuoYhacdxAzKRXRH8r0BS2aROzMuymlyzirOnrTxp46QrP4d6V1al9U45Kvzb
	yXJN0k4NhPHFgIBXKO/DDinbkI67qWc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-XUIRzn01OyqsJRGS-6tEYA-1; Mon, 21 Apr 2025 07:09:54 -0400
X-MC-Unique: XUIRzn01OyqsJRGS-6tEYA-1
X-Mimecast-MFC-AGG-ID: XUIRzn01OyqsJRGS-6tEYA_1745233793
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b0dd00e1a01so1583591a12.0
        for <virtio-comment@lists.linux.dev>; Mon, 21 Apr 2025 04:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745233792; x=1745838592;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glPxpukmtl+ClcsknhBwuubnuKmo7/1epD20jjekMO4=;
        b=sAdUeHDdrC8kWodIpvpliRdheOcVCrlr/t4QYqeX0cYRauq0igAiM3mEk92Lh95teT
         MPl1Rs0uiBc0d8fcGGQO8tutcdoSG8zdrwyCI5mxo/+wrBdVX5RuDRRnZ/NikontP+gr
         ue1I6fDivNIbjLGS7RTw0Pbrm5yukgFBI+RPveGyIGO876Pb3KJ+0tyv9RW0x+RfvneD
         cgkW0EC1UMVk84cnX+MlT7aZsC8DhoiN9x2lo73tAOUZH1ezS1CJhGRowy8wA5iBwShH
         rS/EqQjJ8H6PGBgV9exzIsYERcIMumCM31RrC8pYuhAzCNyzrsnD2RpzzQq9cA4xysKF
         B2iQ==
X-Gm-Message-State: AOJu0YzdSRIfvPfQOJUKxdInNCLx2TGUI524aO68riBfuR5IozVcvQTr
	EOg/CXyvJ3nJtOoVciHK2+aIp2hQsA3YFAZ/42U85wkXpjG5XiweX3VWPtFTQRCbTiLkd4/R0Uc
	I15YgH5o1eRbAO3C/0UlxryM+omCrtab41hZ3HAEYwtd9fMF9Ot8MRQ6XSve1kGN320L4dTajdB
	j7Sb3v52RTsjRytOgMTcQYTNRNO5T2dd8LUpJtBf/b0VH+kLFOYg==
X-Gm-Gg: ASbGnctkFQ5117O/x2aaRTItlMGYCR061Tpb6RUuhARMP1Jd65aLfxHGfCRSJj3kd80
	sh0sn3sWhOUy7Egt4pnxqxPuWTBJrqAjd1ErCgCfH44DetrSsZFROtjEyppuNjn1ABQ==
X-Received: by 2002:a17:90b:4b4a:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-3087bbbbd74mr15968413a91.25.1745233792219;
        Mon, 21 Apr 2025 04:09:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHlcP0oq9ZUAo8j6fcUfbig1etaaFFCEvsM+/CJffRhO0YwhFeW5AH166Xwv3ZZh8xO1BXk00rTfxDuLgw4gI=
X-Received: by 2002:a17:90b:4b4a:b0:2ff:6e72:b8e9 with SMTP id
 98e67ed59e1d1-3087bbbbd74mr15968395a91.25.1745233791959; Mon, 21 Apr 2025
 04:09:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Apr 2025 07:09:51 -0400
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Apr 2025 07:09:51 -0400
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <20250410143456.122942-1-slp@redhat.com>
References: <20250410143456.122942-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 07:09:51 -0400
X-Gm-Features: ATxdqUGcLkG4DBGeRhShBWR5kTqIPKy2Ll7IyFx9cBsPIU2mZ9WeHWBC_h4GJvg
Message-ID: <CAAiTLFXcd_wwf7kWN7eWSaC=hB14njh1OMnkaG0_HqgwO=qCHw@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-gpu: support blob alignment information
To: virtio-comment@lists.linux.dev
Cc: parav@nvidia.com, dmitry.osipenko@collabora.com, mst@redhat.com, 
	dverkamp@chromium.org, gurchetansingh@chromium.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QkRz-PtbghXVBnBZ1tw2FnnO26s34_HeDCIjkg1aqxc_1745233793
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Sergio Lopez <slp@redhat.com> writes:

> There's an increasing number of machines supporting multiple page sizes
> and, on these machines, the host and a guest can be running with
> different pages sizes. In addition to this, there might be physical
> devices that require to operate their memory at a specific granularity.
>
> In these cases, if they are to use Shared Memory Regions, the device
> and the driver must operate with the same granularity, as otherwise
> the former might not be able to fulfill the requests sent by the
> latter.
>
> For the GPU device, this has an impact on blob creation and mapping. To
> address the problem, allow the device to require certain alignment
> constrains for blob resources by extending the device configuration
> with the field "blob_alignment" and introducing the
> VIRTIO_GPU_F_BLOB_ALIGNMENT feature.
>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>
> v3:
>  - Add driver conformance statements (thanks Michael).
>  - Avoid using "must" outside conformance statements (thanks Michael).
>  - Elaborate use case in commit description (thanks Michael).
>  - Drop "padding" field requirements (thanks Daniel).
>
> v2:
>  - Clarify blob_alignment valid values (thanks Michael).
>  - Rephrase feature negotiation (thanks Michael).
>
>  conformance.tex                  |  2 ++
>  device-types/gpu/description.tex | 28 ++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/223
Could you please open a voting ballot for this change?

Thanks,
Sergio.

