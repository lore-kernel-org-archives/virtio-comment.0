Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB3D220F30
	for <virtio-comment@lists.linux.dev>; Thu, 29 May 2025 06:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748499083; cv=none; b=qv5IHwN5aFZJTbLT73DtxfaugY/Vnh35q5r5lT16b4dM/bNbdIC4OcDEhBOL+rQA1tbqLTRiyr3I2bNz4q+LskZz243pFyrd0htgtv1MRmP8573mx8fjLLv+N5M8OkfUCngY/Phcx/x11Y0yhIT2lKk8aROlQgytwfdzEAuu4Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748499083; c=relaxed/simple;
	bh=s414gaO9Su0rL+aEf2ZsyQ8jH6xhekV8xHmN++60TDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N56GXrzqTykPAbDCtLaazOSkVW17uOVs1OhXeFb4QTCrCvx2aYufAQFBXCxaa8ve79icyz5H3rDQblLtZJh0nyQUkxlvwznQ0IAq0AiEC+bIoAs+FwBKUGRi2Kt3/NHQmDj7NiS+WUVA7ztxGV3E8RP9stgeHeMnxm7Lh8G1TBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Arm7b/BW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Arm7b/BW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748499079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s414gaO9Su0rL+aEf2ZsyQ8jH6xhekV8xHmN++60TDM=;
	b=Arm7b/BW+0fL7oSZlt44Hup2MhLP/p3NVstNEHKy9PI548DzvpLjWqkBqU7XfYW9fw9p0I
	nCA2kdTFgW59Hi8DTjOjp8if0aTg/ovRFp0Zr90rYT1Yd+1b/sIxzqupP9VMMaJgghZxmp
	ACauhD2ug4GwUeILlzJlJhCEg3899U0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-gD58ed3rPqCIqqJz2BDjdw-1; Thu, 29 May 2025 02:11:17 -0400
X-MC-Unique: gD58ed3rPqCIqqJz2BDjdw-1
X-Mimecast-MFC-AGG-ID: gD58ed3rPqCIqqJz2BDjdw_1748499076
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31215238683so484596a91.2
        for <virtio-comment@lists.linux.dev>; Wed, 28 May 2025 23:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748499076; x=1749103876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s414gaO9Su0rL+aEf2ZsyQ8jH6xhekV8xHmN++60TDM=;
        b=tU1/7uyLhIfTX3MSIaXxw/TP9/d+gJatReXzSpwuj2O4mQ+S/haIqZE732NyeuE0Tp
         SH/RyKeMAnxHf5cJ7AbtuAw7+YUui/Rfzju9+wzmDVmA+X4nZqnpjQfqUP6sgbEVemR8
         6fwsksck9adVmV2u2mXW30bMqcPkOLjJTa5cNJ86zYtqMvTlwJsn/G0jrP/PFjl1/qDu
         ZBGWqtvCMShM0sUL8AbGEuOLtpRjsHxmEsRjpj4Fpg4utk6nERfDgyH1xdj4NXNEimZU
         IbLCdogUex7csmBDT2qrr6+ocZMp06soKvgCbVW2KwBBgWTrQm3FgJKhwgbAkd5kTJpU
         O8rw==
X-Gm-Message-State: AOJu0YxgulxoQnZn4daWIo4N6FJ86XYmN1LzLL+SWktA6PnX2GK3ZmZy
	Vguz9CplwyYwBCadBAXPoskTjGlHvwXVk1cReegRhEy5q0QhC/Es49eS89nL10DA9Ot81vYAt2G
	inGEQRoJ1A0NFcatNP8NbWGXWMFwoUJZWG9W+LKNwUwp1mNHEVHRQpqAeW5OJbrzbowkt5yVicA
	ejlST2uotFeJJ1r/PDEvNz3/MxOOJO+VCCqhVi+qGK1PE=
X-Gm-Gg: ASbGncu08MIHyrrTt9Ht5U28JqkEu3NXjk7+ZgA+gGU+nSwsDiCNbMGMebOTxsi/u/W
	ZeBFHR2v9ciQ5zJPbLtXbdQr8zwWQPO2MMsTVJkCmr8OAZm0qmsco1cyIKZgoYgC0Yq1vtA==
X-Received: by 2002:a17:90b:4ac1:b0:311:ea13:2e6d with SMTP id 98e67ed59e1d1-311ea1330a2mr7342611a91.29.1748499075903;
        Wed, 28 May 2025 23:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg+UMNvC0KIV4XIh3ZjXBjAl322v09GMY+VaXmWSSTmUE5T8b5NnVnxYCLxRacIb6TDERrizfF1wn9e9DOhoM=
X-Received: by 2002:a17:90b:4ac1:b0:311:ea13:2e6d with SMTP id
 98e67ed59e1d1-311ea1330a2mr7342568a91.29.1748499075400; Wed, 28 May 2025
 23:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6af50c9ada76d8168d248827e4af7c44bdfa34a8.1747826378.git.pabeni@redhat.com>
In-Reply-To: <6af50c9ada76d8168d248827e4af7c44bdfa34a8.1747826378.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 29 May 2025 14:11:04 +0800
X-Gm-Features: AX0GCFuvSzLFDFFNQE3UqjfLTBzuNs52afQzYgSEQ9oE_PvwZ9cFewBjvwWv6m0
Message-ID: <CACGkMEvgToMLd+G3kaF+yREo0q4NH6xGQ1yT2qAuOVUza6pPPg@mail.gmail.com>
Subject: Re: [PATCH v2] virtio-net: clarify guest offloads <> features mapping
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, Willem de Bruijn <willemb@google.com>, mst@redhat.com, 
	Parav Pandit <parav@nvidia.com>, mvaralar@redhat.com, cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BPpP2M4PQBOXWSCnH5bYi_ghMsbcRa6e_pGAIryluGQ_1748499076
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 7:20=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The guest offloads, as specified by 'Setting Offloads State,' use a
> 64-bit wide space, while some of the corresponding virtio net features
> are in the upper 64 bits of a 128-bit wide space.
>
> Clarify the relevant mapping as somewhat implied by the current text.
> Also rename the offload definitions to avoid referring to different
> numeric values with the same name in the features table and in the
> offload table.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/225
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

