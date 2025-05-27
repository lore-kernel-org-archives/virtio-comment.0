Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7861487F4
	for <virtio-comment@lists.linux.dev>; Tue, 27 May 2025 04:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748319735; cv=none; b=kX9d3oHZIkEXlozXs4HntL2klA+ViFK9NJhyVJrzBR0sljcULziN1v6v6PikCFUf7QcJRnMtR3MIXujoySJC60EJ92mBoLjzSINAkP6BHep37ScRaMkEfVg40MOQ83+TyhkWBfAL4jxJ+uOriWxu8PYxu4sLDcyrtTZ4eADStHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748319735; c=relaxed/simple;
	bh=PaoNkWoep1lmG0EwXCs4YxoPkY+jPxv+fB9qsAzWM6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz58DgCdD1P3fFrO1YiIP9LcWjugO/hFS2MfBUID+XloEttkQtPq/yZ0qP1D+HaDF4WBX9bCnR7a5UE2oIprdOS/g99KBdWw09l20VTAYtDk2baCNgSXEvbBcRrJF19HllmSrCsAQxEX9T2eeqP+mqA9+Yn4daFwqzgx67u5FnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Twr3pGij; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Twr3pGij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748319732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PaoNkWoep1lmG0EwXCs4YxoPkY+jPxv+fB9qsAzWM6M=;
	b=Twr3pGij0/p27dTrVM9jYLt+j7BOMLl+GAFtLeMBQrmH4xUlAZHdLWd2J1ES2Xe9HAQpe8
	YHIZdFtR+7MX7fErSIZbab+xmKI3eD3MIQBPBGmH00jZDubXc2Ef44aowd/vr4ZWap1CTX
	QUVq5g0MG8PeJKmFIeBi2YAUU5CnZ0s=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-jZshnoB_OvOpGxnwGJssLg-1; Tue, 27 May 2025 00:22:10 -0400
X-MC-Unique: jZshnoB_OvOpGxnwGJssLg-1
X-Mimecast-MFC-AGG-ID: jZshnoB_OvOpGxnwGJssLg_1748319730
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742c9c92bb1so2085850b3a.3
        for <virtio-comment@lists.linux.dev>; Mon, 26 May 2025 21:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748319730; x=1748924530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaoNkWoep1lmG0EwXCs4YxoPkY+jPxv+fB9qsAzWM6M=;
        b=UkZSRSGEq+k08VVctsjRPMtzRH9+PbefR/L2YihSsb8k0avjllhyxC5YkUANIJ7H0O
         134j7GfFy+wJmwJM+NNJ1WcG5EsTqcsPGbpgCuKFIuITRYO4z51bfynjw/hz9bK0+tt3
         OsA4vNTiT6Eg8TzX4w1Bydtz8+ZM74mgg+4tW6qDm/3sQBFEimuLKzfMTMAL/YOxtprf
         Vyy1YJBXl3rDxtYsfa/+viAsgCPqHnyi8u6Wy+UdRgy3xB7gvzwmI5OkPFSFSTELyRbJ
         9Bwxm9sU1PVQqtufjiGyjm16v1sdMSzqPJ/t3/45q7SvahUFnv4l2JXuxlUHUoruGoZx
         SV6w==
X-Gm-Message-State: AOJu0YyJfZeKUMvongqnH9LW4CXWNFypYcX1lbM84BCCtqQcoIUV5GPE
	gRTkuDVop81TjM7ZJGzO2LZ0Ln5bofISQV9IRR5VK+v1CaWQ7lsKb2qa+yxThLHinVvRdAHko9+
	DiKHYNG7itlZsQKEs8OGw7Kl+0EkXLlTCWItjd2wlRAj4mCGTgguYpMX4QZJ1e931zn5EIVxWIU
	r5yzLPvF/Xrcg8hbxJ6X19kJ1XwYjnKrQvG/StSkiRRGI=
X-Gm-Gg: ASbGncs42Tu12yXip23JbNgPwsFN3/cG+zLLRfs8pZk9uO3+U3hqMWYupUQc/7FU9Iw
	Hj777+RslIabLomCwt8xjkTahVZLwnkm51cUahxfWyQlQuQogOeyLD8CfkM/4Qo13p1pgow==
X-Received: by 2002:a05:6a00:4886:b0:746:1e35:3307 with SMTP id d2e1a72fcca58-7461e353558mr3877007b3a.14.1748319729806;
        Mon, 26 May 2025 21:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ0YYyXUXTc8+AoPW+iIyuQA1faXbiM2/al1ikrurU0uYR0SGHo0nEECJKsnOT44KKT7mzU3jmM8T+spbhldM=
X-Received: by 2002:a05:6a00:4886:b0:746:1e35:3307 with SMTP id
 d2e1a72fcca58-7461e353558mr3876988b3a.14.1748319729422; Mon, 26 May 2025
 21:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526-reserved-v4-1-70231a8edc79@daynix.com>
In-Reply-To: <20250526-reserved-v4-1-70231a8edc79@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 27 May 2025 12:21:58 +0800
X-Gm-Features: AX0GCFvOTTd0BFszIQpACq98yNl0KNfhmThnIFfnZJK0cOtdYTXdsxMghgVB-Pc
Message-ID: <CACGkMEsT101TehxbqBA8dLqaNJsbANsHQQzvgECmXMjmgLqjQQ@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: Ignore num_buffers when unused
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>, 
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pSyWSl95C6oc07kxipFIvdnOxBMOXgKNOiur3qPO4Qw_1748319730
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:15=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, vhost_net of Linux
> prior to 6.14 and QEMU prior to 10.0.0 leave num_buffers uninitialized
> while the specification tells to set it to one.
>
> Let drivers ignore this field to make them compatible with old
> vhost_net/QEMU, similar to the hdr_len field, which is also marked as
> unreliable due to implementation bugs.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> ---

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

