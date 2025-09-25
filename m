Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A355E2EA75D
	for <virtio-comment@lists.linux.dev>; Thu, 25 Sep 2025 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758797153; cv=none; b=DqvU5uL8+qABHAzpdzokKp8FLUYuNDHqXnO6AbeyhNHnNuKNdNeoYMmruVj0WzXeHWFjxHvRezgTf3sryvH/95C7VQw9XWWuMmg5FAaVyHKjsNNgiNNlrpYcLzhKWIaE0Zv/sZEl/uIiyFN9u/AWGgLlSFXYavOQef2Oyy7HvFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758797153; c=relaxed/simple;
	bh=+Qx4lybWycQHN7dkj+ppZl6Di0OPnozpaEfGiLXtFa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcnNKB79L7O53mX12UANsH9rpkFNbqN8b7fvr6B9PFKyZ8MqPMdI9QEgjdN80gObBprHC7acSqFORRo1fy2Sx8+78HIdAxdb4DAQWo9PxJt3M4DijNg+5qOVATsxCP0alAz6Okapl8xO75JFnuX1izfa+bLo+ivcB6HzjAx7BiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d9Z7+c5A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d9Z7+c5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758797150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Df/puUGOZYoeIMYzHR1JDiJAbwv2c7WLLbdqVVqF/sI=;
	b=d9Z7+c5AT6iCx5m67NWj9oDtusj26UnFShjxajcdGD3DLrduY339UMUz9wjSDguOb73VSb
	S2fmiziqvvkCyvHtpjA8NKigQapbKSXZfhCH30wQY6fQWRt/M70SmNAEtigsi7Na+CDg5y
	d5bdv+LAie0xxiMJtEJlIp8SsDX/cp4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-ONrJLgj2OPSdZieeMd8mWA-1; Thu, 25 Sep 2025 06:45:49 -0400
X-MC-Unique: ONrJLgj2OPSdZieeMd8mWA-1
X-Mimecast-MFC-AGG-ID: ONrJLgj2OPSdZieeMd8mWA_1758797148
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b2ffa89b620so71087366b.2
        for <virtio-comment@lists.linux.dev>; Thu, 25 Sep 2025 03:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758797148; x=1759401948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df/puUGOZYoeIMYzHR1JDiJAbwv2c7WLLbdqVVqF/sI=;
        b=M52kIwOKl4vP23DwR013mGrS7b8KsBtO1XsDsBXkWktfpjGTxRn6Bm5eeabWIJThpT
         W6uDg4KuNqWVfgWY7Uc77fJtldBGYUjogmvpwxnnbfvm14wE+USQGAb2F+38dF7OWUWV
         vgYm5G71tVc0ycAoCVwd2OKIA26zEj/iCLEjFnbp+WwIRLPd2EkNt4OwLooxXGIrRVDo
         g5Q2NgEijK6+E5GkIqIRi+q9A9ws7fm0r4OMEksvi81tbdO7B29tgxUQKdleOgBXfCPq
         GfOjjRIidhfGeuevaxfNlEqliLOASYIlZFKeW4eQonuJK7NfWr4Jz6D7EjCWbRfzp7g6
         fXAA==
X-Gm-Message-State: AOJu0YzGakuhco2FOXRxpQBI9FnICQSX8xqv2Ds3qJfwB82l3GUL66fD
	WKJRqmOsa4wpyaUPmlt5hCRgMgrOVIjBd7847DxLgcyQKb7lIRJHz1oBf8rkgpZgA0uuU4umyuA
	HlDifinn25hJtt0kCsqyowraj3WMfb+pdiUj6MihLm4woLD2sNuLKwb35CCs3P73BaIW90SRKck
	crqTejeF699nroaH9ZXhX4jadQ1H31OGKCsqIppjEuwHk2XTQxK80=
X-Gm-Gg: ASbGncuDntk+J9c2cJn37GiA4J5arJzP9jvwVKFcwmQ9tZEHPBJiKVXh4UD+o3dvNYD
	lHE+nk4dWefWJE4/g65pQK2sQbzPtqTLnfxk3JuonFrnP5ipaWXliJEOSmDDtK75QWQs3nJfYXg
	c3J4ML1uT1Isd9h/HNWORgng==
X-Received: by 2002:a17:907:7282:b0:b29:e717:f0ab with SMTP id a640c23a62f3a-b34be4e4f76mr303241866b.32.1758797147723;
        Thu, 25 Sep 2025 03:45:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3o8djLAxTNgxArP3TTcKkgmopkv/qKO0RxOCrjKPHXkEvOTMD0kaGZmHoxia0l/vh1Tzz/rZ3vwzED4SkFI4=
X-Received: by 2002:a17:907:7282:b0:b29:e717:f0ab with SMTP id
 a640c23a62f3a-b34be4e4f76mr303239766b.32.1758797147292; Thu, 25 Sep 2025
 03:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250320114326.2075821-1-mvaralar@redhat.com>
In-Reply-To: <20250320114326.2075821-1-mvaralar@redhat.com>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Thu, 25 Sep 2025 12:45:36 +0200
X-Gm-Features: AS18NWALPnnJyP7skdfn0ZLn2r9Aks3xMfMNCdh6zUl_u4hci4kgLgXYmiJ088I
Message-ID: <CAHYGQ0zWNkFyrUC=wRxN+KG+Cu6t=2nOO3gCEhFiTUrDpdSnkQ@mail.gmail.com>
Subject: Re: [PATCH v5] README.md: add example email for TC vote request
To: virtio-comment@lists.linux.dev
Cc: cohuck@redhat.com, parav@nvidia.com, mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bw7zzrTG_gadFNwfgeRZu7W9jJdvoKUZRymNZhIS5H8_1758797148
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping?

On Thu, Mar 20, 2025 at 12:43=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v4 -> v5: drop subject and only leave body
> v3 -> v4: add "[]"
> v2 -> v3: use "()"
> v1 -> v2: add Subject and To
> ---
>  README.md | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/README.md b/README.md
> index c06caf6..0be389e 100644
> --- a/README.md
> +++ b/README.md
> @@ -206,7 +206,13 @@ The mail requesting the vote should include the foll=
owing, on a line by itself:<
>  <code>
>  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>  </code>
> -(NNN is the issue number)</li>
> +(NNN is the issue number)<br>
> +For example, you can use the following template when requesting the TC v=
ote:<br>
> +<code>
> +Could please open a voting ballot for these changes?<br>
> +<br>
> +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN<br>
> +</code></li>
>  <li>Please make sure to allow time for review between posting a comment
>  and asking for a vote. </li>
>  </ol>
>
> base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> --
> 2.42.0
>

