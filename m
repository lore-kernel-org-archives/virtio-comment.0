Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450541F790F
	for <virtio-comment@lists.linux.dev>; Tue,  8 Jul 2025 04:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751950187; cv=none; b=dtEMco5mPNweFklWibn1ItZQOSpm9Rx3XyR3SMg5axr0QvTw30eQSEhOZ4FH9JWcIHtmh8kNPOP1as4Rw4TL/5g951pohi49fkwVGlwBE9/kD2Kvrz0mv7XAISAgUmgQFD9ENXWS9ekq9+odHGHYjjDCYSIb0ck+xlfX7HawN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751950187; c=relaxed/simple;
	bh=46fGkFE1wu6kl80JaPiJDq/DVoFmJg5NSAL4j/URPw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOvjsww20Q0aVNg46PzmOC2mtWVbBNgdq3h8kbLr35RlEGx+RzfgG+4NYjVyDctlR4aQ+HVCCoAcKMT7tUhgAb1MFVU2ZRrbOz7EwBSmdpyqmaXBp9KL3anc8leiEDuNrNsl+vGGJqDeI+LigmebsRQDRWDrSu9tvYTH+DJx6WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PjgusQsf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PjgusQsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751950184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=46fGkFE1wu6kl80JaPiJDq/DVoFmJg5NSAL4j/URPw8=;
	b=PjgusQsfWbEIditidxCDnRDcISXFrVzHUQeKT09r6HaYLGbHYXOrtlmEAPX/tuQI6qyR2j
	8s0gBBIyKL3cM7ZLycBdZyOgXHZgBJfcvG1XvIWmuPDVljYCbXZJFMDpFbmtT2BMZHf6mO
	DyThq97BVIs/uAnHbqyQrqjZncVMYSA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-wN4q_hdKNoqF9lPihjBmhg-1; Tue, 08 Jul 2025 00:49:42 -0400
X-MC-Unique: wN4q_hdKNoqF9lPihjBmhg-1
X-Mimecast-MFC-AGG-ID: wN4q_hdKNoqF9lPihjBmhg_1751950182
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so3622865a91.3
        for <virtio-comment@lists.linux.dev>; Mon, 07 Jul 2025 21:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751950182; x=1752554982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46fGkFE1wu6kl80JaPiJDq/DVoFmJg5NSAL4j/URPw8=;
        b=Wu6ac6F2EBiSqcJQ1k/HpxCEMPVnGfS+K/0vquezNSj0AjWewhyNddbCi1GslFxkde
         FGM8lw2ayt1hCDdBQfUvYrR5VVZtK9AOle8+NaLOf+iBDqOG5u4AtOX3mDuPRGm/27X+
         aPq+7Z14wFs7wXBoYq/X9xqnaQKpMXUJL2apggENPqzQJuSkdqvbBWz1vXUSNk0Ekbl9
         T3V2Dtajcw++tTCGbe4pvj8dO0k2YvT5Il7/6olhbcBGaK60CFoEe9toArU4lNaNN7CT
         fwTZBKOEvXsCQXbrxZhb3DIbyGhqrKzFp5SZdn3YMkdWk6GI9FXh40UagU6v7Zye0jNa
         /0aw==
X-Forwarded-Encrypted: i=1; AJvYcCXk7NN+YXZvAAaUmyxc1vw12xj4g7saPyHCeVt+RCDI1gh7oZR+D33uJSGF2naoYHUCK4dl2VqBpvz8Dna6oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgOM5EmUSxsqJfRbRAdB/ZpM/V1IoJpzhp+U0g9cCluOs6YA1t
	6PmYFOCYLaNAGDAoGvyvnWNwZOyPyhIfF2ef84O/q8wZ4ddOuRvyD5RbBujjYlBAMuK8nZ5CO0u
	/yPU86Ve2gf/yttZSCzjZt9z9AbBsfD/3DMggwl7dLEjpUb+fnkrk7F7aFqsWobY1EtW3dQ1Mnx
	yy6OyJDs60uPu9UHoFRL1J0HKt1vhnmpmpQGIC2Y50vh4=
X-Gm-Gg: ASbGncsgD7iSHOp4ahanbHm+1TX5wiudO0/zbprwYWX2IG9TIgDKnftJCAV0xsekXDG
	bJ3PwBxJSa2QmVQRhZX3e1Ex1CCSHZbxy1yihF9SbD0LMgOqFCxis/IxL2uBoR8Q0OsdFybG+pM
	na24Cv
X-Received: by 2002:a17:90b:1848:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-31c21dbac35mr2356628a91.18.1751950181781;
        Mon, 07 Jul 2025 21:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0ZKGPEDFlqVtUycZPKofd9Fvc8+ZvEOHPYzxG7/TEbKUJIjzSiz0dG8+gv5nsJDmNM0J4NRuGRbGekIxsekg=
X-Received: by 2002:a17:90b:1848:b0:313:2f45:2fc8 with SMTP id
 98e67ed59e1d1-31c21dbac35mr2356602a91.18.1751950181402; Mon, 07 Jul 2025
 21:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704101739.354522-1-lingshan.zhu@amd.com> <20250704101739.354522-2-lingshan.zhu@amd.com>
In-Reply-To: <20250704101739.354522-2-lingshan.zhu@amd.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Jul 2025 12:49:30 +0800
X-Gm-Features: Ac12FXysfJhAVHeA-cvvPi9nChrYZ0eUSgPC8eTWcmWElgoLVCsSuGHIMQfwowE
Message-ID: <CACGkMEtfaB8ObSQDVEt2EW7hnqSA=+W1D+Ndrmz8G8+OC5wMfw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] virtio: re-order device status bits
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: mst@redhat.com, cohuck@redhat.com, virtio-comment@lists.linux.dev, 
	Ray.Huang@amd.com, Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KzF2n92UiyVpDc1Ke2E6mh0CmqVEGyH76pb8fyzuVtE_1751950182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 6:18=E2=80=AFPM Zhu Lingshan <lingshan.zhu@amd.com> =
wrote:
>
> This commit re-arranges the device status bits,
> to list them in ascending order.
>
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
> ---

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

