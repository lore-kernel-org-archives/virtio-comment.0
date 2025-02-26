Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34806194A66
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 07:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740554232; cv=none; b=QGYzyQ6HOICrNpx61a6WR+rHKJBWF3/SUsnZ1eEQz3LdtswrylOCwJ+fRREN/A+Y+uGdw3W/R3oLcTHJtnBkyvY5esiC6HjcYL64YzjWRhjrL01Y6X6adTWF9owHmK+Z/XRkAnmpc0j66rGQVB4vGdt2llYkuTAq/jJMSerS5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740554232; c=relaxed/simple;
	bh=OUIMqwMmo2Jn4nEptNRyBa/RDf7lwGJ01MKauZESaDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MFxYCoHyXIaDA94uLShu826inI2onlj0f0PsK0Fk0cyRYBtUXHpwD3yBKjM42DLDj2xD7AfnRvQC3Nf2+v690dFpkjQq0QJx0CsAvEFsjbOY1bkvC/KrDsvGduvdx1ujtGYclQD7Q419+iQanlp8hByVaXAg31qPlWLhay65WBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FG0tTDaz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FG0tTDaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740554230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CxNMPJyU2Vt+dIZSjdFmpEMF3a+bdLkGWRzbawKNgZM=;
	b=FG0tTDazic33DNzpVlUu2XCSBDdtSPqK3rYX1hFvwpVztvEJZbNshuruv6bZ09mYOSmLyP
	Vhnhr7rNFWmbaGmb+OtEoax6Dq+X6HoOb02MWdpaDCmjm1lWtcePyP40Z0WiDQjpbEa43F
	pXX6fKCQ7ORJLfm2Z8Epc6TkMLI17cM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-PpXqEfdYNNmKGBo476uUdA-1; Wed, 26 Feb 2025 02:17:08 -0500
X-MC-Unique: PpXqEfdYNNmKGBo476uUdA-1
X-Mimecast-MFC-AGG-ID: PpXqEfdYNNmKGBo476uUdA_1740554227
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-390ddb917abso29294f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 23:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740554227; x=1741159027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxNMPJyU2Vt+dIZSjdFmpEMF3a+bdLkGWRzbawKNgZM=;
        b=KESDbzB5rRcwEIuXvFEsVz5TSvKQw2/AiJjuhAfDLWPSPwYjVHl6j9ihkLuBoXOCvk
         +K/y/816zIazUi+2HAoDZBxXjQ1Z7ChaTnS0dfh7jZvrpsUOrnK8Ltw0Xg88wTsNfbdT
         +5v5lohsx0db72K499VrvZ4VXg5/y9VNotcEBH1cKpH1kVsOgeQytTnN3dfegHTBwM3e
         yV8++0qehKq91SPm9FkO+5N9HaROFHmUwFy1E+LCXDCh3uaCN+mwks8sbZvC1XExTQlk
         kqYvIlwMQ2/byYnGOik1eTx66XvDK+Ne2DttiEc9aLEqfY73I4t4/K5fO4Ij2IJDSafE
         hjSA==
X-Gm-Message-State: AOJu0YwEZUdJiFOSaJLtQdsfbXy7VGnKP/u2QgXoui7NK8+KzJNK90iJ
	kLBgWQcpXCtyiXScSnfF50gQwhDZW6fXqhDCx4bT1UXiYdxbCfNCTV8T69LJOc5KRnbgC1d6891
	Pt/y1hW1+JxjyKaXX2601Svl4gA8YH6ZAJaNmxq4R5ksGEI7LPqqzRXfR3iQbS/qV
X-Gm-Gg: ASbGncs/Q8hIm2WL2Q2/8kIlhVuUryYVTvY78qli4KWxxpvZHXjH0iHkHw2TJ7X6c3y
	pmqsaYgujzsDt3dv+LvNYfOdUTmAMJqRBZBEocdoPeCNeDGKVOMyA2968QE294v1fZ509J0Ga9y
	3VjET1O9mQpkHTtF7Nmj8KBpeFVHzbBFPOTcKOJdFRWWG/tPGRJ3NoeBCMBazbG2RYbRp/v0WFY
	avYAIyrmw5zUmP0MJMjVUDl17BbGiRbLw8npFOO+YVDPFI1u2WxJgyRzz7Jlx8CD12gjj9GhVi+
	zdnhj3hipQ==
X-Received: by 2002:a5d:64ae:0:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-390cc6324a0mr5420511f8f.39.1740554227180;
        Tue, 25 Feb 2025 23:17:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELC8pnVBFdhk4cCgpwIDk27+r1iKMiydC+789QHMQtZTpwLt2eu4iGbEQlvpWHOT7+rYRzxw==
X-Received: by 2002:a5d:64ae:0:b0:38d:e420:3984 with SMTP id ffacd0b85a97d-390cc6324a0mr5420487f8f.39.1740554226824;
        Tue, 25 Feb 2025 23:17:06 -0800 (PST)
Received: from redhat.com ([2a02:14f:1eb:e270:8595:184c:7546:3597])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7108sm4652487f8f.69.2025.02.25.23.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 23:17:05 -0800 (PST)
Date: Wed, 26 Feb 2025 02:17:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhang, Julia" <Julia.Zhang@amd.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"Zhu, Lingshan" <Lingshan.Zhu@amd.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH] virtio-gpu: get p2pdma distance
Message-ID: <20250226021617-mutt-send-email-mst@kernel.org>
References: <20250114101612.88304-1-julia.zhang@amd.com>
 <Z4+og7rL0h5JGYCd@fedora>
 <IA1PR12MB6532FC13BDCAF1D2E0D336E0F2C22@IA1PR12MB6532.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA1PR12MB6532FC13BDCAF1D2E0D336E0F2C22@IA1PR12MB6532.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IouoR3i7zXFwVIldz30z5vKmYRiW6_WUnSRG3FG1pp8_1740554227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 02:26:32AM +0000, Zhang, Julia wrote:
> Hi MST,
> 
> On 2025/1/21 22:00, Matias Ezequiel Vara Larsen wrote:
> > On Tue, Jan 14, 2025 at 06:16:13PM +0800, Julia Zhang wrote:
> >> PCI peer-to-peer DMA transaction may be used in guest for some scenes.
> >> For example, dGPU prime feature will let virtio-iGPU access to
> >> passthrough dGPU buffer.
> >>
> >> To support P2P DMA transaction in guest, virtio-gpu needs to check the
> >> compatibility which is represented by p2pdma_distance. This defines a
> >> command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to allow guest send virtual pci
> >> notation of two devices to host and get host physical p2pdma_distance
> >> of these two PCI devices.
> >>
> >> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> >> ---
> >> Hi all,
> >>
> >> We are trying to implement dGPU prime feature in guest which will let
> >> virtio-iGPU read rendered data of passthrough dGPU. Before that,
> >> virtio gpu driver needs to get p2pdma_distance to check if P2P DMA
> >> transaction is possible or not.
> >>
> >> To implement getting p2pdma_distance, QEMU needs to handle the command
> >> from guest with virtual pci notations of two PCI devices and send it to
> >> host kernel and return host physical distance back to guest.
> >>
> >> So this defines the new command follow the suggestion in
> >> https://lore.kernel.org/all/20241207105537.542441-4-julia.zhang@amd.com/
> >>
> >> Regards,
> >> Julia
> >> ---
> >>   device-types/gpu/description.tex | 29 +++++++++++++++++++++++++++++
> >>   1 file changed, 29 insertions(+)
> >>
> > 
> > Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > 
> Does this patch meet all requirements for merging? If not, what should I 
> do next step? Should I create a MR on github?
> 
> Regards,
> Julia


No, here are the instructions:
https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues


