Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C63BBFB
	for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340060; cv=none; b=sdIxxquxLfbJf/AfS2CfqWYfF1/c+MuBPzVfFyGcu/k0WXlryjJKskULsoGLrMJcdEqBNfiFnFQq9HCcjpJbiCm6FEajhVr2uXk7sR4Ptjb9IN6F/kAD9k9/iCtZtioofiJi/yak6KrfGEkVQHhttIMjmSWRMWuf0ZdKkDsSl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340060; c=relaxed/simple;
	bh=a8WLd2J07ICTbeRua8aUiVJcejCaqdGjAj8yu3grbGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdRefWMeP32veON8QXBVgM4Zx1wdwcPSYvEg8raU1jvQybZGVIn+DGks1X/Dhx0L8kx6NnQXxQ+5yto5KS3o1krxNuq9SkEVhpjwtEZO38MIcWULvHr+xNcRJOcsoob9BFtRkCpI5mcU4e7lxexGRfEgawwuGXWMEnoZovOp2io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFYxwKIq; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFYxwKIq"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b5b65b1b9fso8093927b3.2
        for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 08:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724340057; x=1724944857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFgCwWIB0Vdby+7yw2jhO46pl5p73mPBVAcpyHvDKdU=;
        b=RFYxwKIqAr5YYT+Ia1PgTVkbdqNU8/0HGbXgLT/fNrOo2i4+2AmUURLdtIM3EoYowW
         /lnRcs5WCeB1WbBUD0ib4mv0JQG5rPyieoki66hMhzHMYwYH779axb/jtkWXgfQ/dsxo
         goPen0ljtv/tt/270me0PLAFXKdmkRD9mHW9154dqWX/Vu4yUq3nq+F23Tks4LrjwqZJ
         euIMGZvMAF9m7p2oQMornTM+AlnSt9lvfeFbk7w2WfIB8l1+peeFzLuTg2rEprj7WmkK
         SQVMh+Rn/JW7oQMtZVUnaecDlcDW2ln0hZM4k3F55PlAdaWeuxasAIOflwoEXPXkqYRg
         VkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340057; x=1724944857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFgCwWIB0Vdby+7yw2jhO46pl5p73mPBVAcpyHvDKdU=;
        b=fSSP5RW+vxvmZcRu4zzUkr3KgYlLSMiTFC0vcu86Gxrl3ov24QiYLpNcplGSYf6CG0
         NqQmA2DfSTu3YY5hTWj6Do8kt6SR3rzYe0fgxzcfZTmOxLdwVCyaj7ENQxKEecMYY9UN
         rivkwEE603vJfDSPXH03I/flwQSZZbZQIlK/ESs5aYvhhVQHNiac/JlnLKnT2rKTvJ15
         uVmOt4En/WFzgWC56rb5wwiyrU2DjMKT1eFI2JZ5taYd4OKAJYTawRjqhQSe/jeHpQyV
         9baJ+vDaua4MhLTKrCItvfFsIOFdRwvQKfwimx6Ls+OZ7U9FPxFfN1ogZuC7Ix1cjg39
         yMYQ==
X-Gm-Message-State: AOJu0YwngqMmnVd/OpzRmugoqbXo5Ju6PU1C0k9VO28VMX2WxvBiqp0S
	0x5kqM0cE83RDaIstpKvRNCZq9Sp5fqIjJOm2uq7di7vVySX3IAZO1n5QzDDoXsD/cM4BY6S9Uu
	DXm+QlbWCs/ugb2TVvcjCEAaw7h9D3vJsWn/V8FNl6RE80sIJjA==
X-Google-Smtp-Source: AGHT+IGQzNXZRY3gqrgAw+yp9Cwo4b2qbEwXPmZORl3oJleUqSTQlTBT5n6wna3GK8lhF1HeZBQD0I71PQQIE7crxlk=
X-Received: by 2002:a05:690c:108:b0:664:5957:f7a with SMTP id
 00721157ae682-6c0fb640ef6mr73032667b3.15.1724340057327; Thu, 22 Aug 2024
 08:20:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1724234131.git.pabeni@redhat.com> <b3a93378fbe02aefe4450f97e21138a757c41036.1724234131.git.pabeni@redhat.com>
 <CA+FuTSe1Wz8T5NDUA-h1izZ1mhz3z0jsK8XH6tgtREz00B9nhw@mail.gmail.com> <48eaa7e7-3cd7-41ca-8109-892702ee9350@redhat.com>
In-Reply-To: <48eaa7e7-3cd7-41ca-8109-892702ee9350@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 22 Aug 2024 11:20:20 -0400
Message-ID: <CA+FuTSdyz_VLzmfjm7+qoRQW2Xk8vJfd=w1Mn-20JNNUbPgu+g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] virtio-net: define UDP tunnel checksum offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:19=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 8/21/24 21:42, Willem de Bruijn wrote:
> > On Wed, Aug 21, 2024 at 6:03=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> @@ -425,6 +446,7 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Network Device / Device O
> >>   #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
> >>   #define VIRTIO_NET_HDR_F_DATA_VALID    2
> >>   #define VIRTIO_NET_HDR_F_RSC_INFO      4
> >> +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
> >
> > Only now notice: since this is only valid with GSO, should this be a
> > gso_type bit, like VIRTIO_NET_HDR_GSO_ECN?
>
> I originally placed the flag here for consistency with NEEDS_CSUM,
> before making the TUNNEL_CSUM offload depending on TUNNEL_GSO offload.
>
> I think it's still a valid choice: the bit space in 'gso_type' is quite
> low; will be significantly lower then what will have in 'flags' with
> such change, I *think* it's more future proof this way. Do you have
> strong opinion otherwise?

That's a valid reason. SGTM.
