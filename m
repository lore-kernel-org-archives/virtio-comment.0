Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD5139CFA
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 16:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741277747; cv=none; b=bLEHwLqe8+sQafxe5JPViWvOjdPMmTgVyooF6zAzrL1vOGfePO02YPHcvtaHj053h0Bc9ExPIhAHIW1ViyRjw9GxMhYYTVan0m798FWZWxf7yH/Sqwwbp2plgBN6Q+CFseMSSDGDwpOwdHBfxNhJ+97uUtOrQX4u/+cOmyVoYpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741277747; c=relaxed/simple;
	bh=wL/8Q/A0UqZqUyAfP+6LhRbMb4PjP4rHCCqYZey1Pvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVSKRin/gqrjHH6o5zdzuwfTqOJk4jgGP3OH6VlGhk78F0xd8KOw7b0sjTtJt66zvR1+RhDKe7C8jZYm2CpcqJLHfQ9YHIiklHIZd0pmRF6lFOusBTi9k9T2LDPQHMJKH3gpAKMNY5Ai6O4SC5TBQ3f4RajH4WeGjUmUNLSr+GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOaB4ck0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOaB4ck0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741277744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZJmRdUuZU9tPXTpbYvfacq/I3x3FU56xYQ6hvqdszc=;
	b=IOaB4ck0CQzYMPPyyuHxD7F1yEPiBdTWlip17pHViK1akeep8o6oOwzzHYyWvPtjjpNij+
	du0GiKCtIe4jPMnm1vyTK+gU7wjPbf9DJSjrDyQBvHRnry+7r/+fA4xFpizj+KoziCb5Ze
	lBUwZ0ZeeFxmHOGwaUDD1Z7VNFNTpkk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-o_q2oi4oP5qRbTbrL_VkSQ-1; Thu, 06 Mar 2025 11:15:37 -0500
X-MC-Unique: o_q2oi4oP5qRbTbrL_VkSQ-1
X-Mimecast-MFC-AGG-ID: o_q2oi4oP5qRbTbrL_VkSQ_1741277736
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso2452371a91.2
        for <virtio-comment@lists.linux.dev>; Thu, 06 Mar 2025 08:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741277736; x=1741882536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZJmRdUuZU9tPXTpbYvfacq/I3x3FU56xYQ6hvqdszc=;
        b=s+QAgtEcxGiCfHiVLCphMeFAQxUhmpp5/6TSXjC9+06/2MsvnhJ7uFG0lLlcWgYBIn
         zqrQDJnIe41oNgHGgPyDJYNEOAO+m09NPIpbv8yvn5Qlw+Vwju85+IXXC3mymGBDYi4W
         6d6oI+byXldiY8bPMOIXKUeCZLJ/3AwJiaxndLZN4Np9Y5Jmlat5GsvASwCrqIgDWCpV
         ArfLfnRp8RxGzIYkvZtW+lcpZ35Mm1IgV8SAgNDpZfTiJbpN71C17KddF6SjWgLCs5rD
         lg5mlHVFVF3KOgfh0UA/YFl+HtaIoATBj1AJmyWyMzVS3y0WC0CYHIcvyxKD1CxC+RCw
         2pxg==
X-Gm-Message-State: AOJu0Yz0bcYrThBKxqEsRwaHRDCRaryvVHHK5AIwKiq36zkWCLrlOgYr
	Z8s7vAxSO9iE3JYBRfu+G4se67fmasVNNVChp95ZTkO77bIAncXtMa2hBTVYjzbDVJe43gYhZYk
	3/uwDeqDcsrezMHmbzMVG3uloz61yoALJ51vLsyFLdCKg/6oATv7b/uZ4kfBWwN5vvSF7cqD9lG
	BxBTziyTlITJ9yFqOSM0KcnnOWIAVLakr174t7vCo=
X-Gm-Gg: ASbGncvhA2SnC0I5d+DX590YsCAD6jjjLEyp3EkuO2LukeW0PnqTKKINMU1RraVOU9b
	MlEhxHL+fBZaazhWpFfPMNeyYHZXl7SNkknR+61Gk/H6JQU5RAPGQvHJNzS3By04i8XFA/z9bgS
	4=
X-Received: by 2002:a17:90b:264c:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2ff4978d163mr11421815a91.5.1741277734850;
        Thu, 06 Mar 2025 08:15:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA2rHKTdB6U61gcV6rxg8TNplVEejKFWxLymU+ji1KiqPQWoHOwaaJuXEkP0GhcgIXHdLKFUIioMxNeNDamig=
X-Received: by 2002:a17:90b:264c:b0:2ee:53b3:3f1c with SMTP id
 98e67ed59e1d1-2ff4978d163mr11421348a91.5.1741277729531; Thu, 06 Mar 2025
 08:15:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305164546.1484029-1-mvaralar@redhat.com>
In-Reply-To: <20250305164546.1484029-1-mvaralar@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 6 Mar 2025 17:15:18 +0100
X-Gm-Features: AQ5f1JpY4q4TIyBEGzYoDOWF6ZQSDifomsu913ibz7SY2pEANNWo5DaNc_fXzIw
Message-ID: <CADSE00+YB-FTKePPY=k2mrA7m0VCCJQ5j-A0bXcaSejiH5hocQ@mail.gmail.com>
Subject: Re: [PATCH v3] git-publish: add profile
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6OmW0ppgSN7Yeuta9S5b_v757NJgGdJ3QgBySl4lN7Q_1741277736
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 5:45=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Add git-publish profile and document how to use it.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v2 -> v3:
>    * remove uppercase and the line split and use italic
> v1 -> v2:
>    * add link to git-publish
>    * document that the project contains a profile already
> ---
>  .gitpublish |  3 +++
>  README.md   | 15 +++++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 .gitpublish

Reviewed-by: Albert Esteve <aesteve@redhat.com>

>
> diff --git a/.gitpublish b/.gitpublish
> new file mode 100644
> index 0000000..d412896
> --- /dev/null
> +++ b/.gitpublish
> @@ -0,0 +1,3 @@
> +[gitpublishprofile "default"]
> +base =3D master
> +to =3D virtio-comment@lists.linux.dev
> diff --git a/README.md b/README.md
> index c06caf6..b521978 100644
> --- a/README.md
> +++ b/README.md
> @@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
>  git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-*
>  </code>
>
> +<dl>Optionally, you can use <a
> +href=3D"https://github.com/stefanha/git-publish">git-publish</a> to subm=
it a
> +patch. This project already contains a <em>git-publish</em> profile that=
 will
> +configure some fields, e.g., <em>To</em> field with the right address. A=
fter you have
> +installed <em>git-publish</em>, the procedure is the following:
> +
> +<code>
> +<p>
> +git checkout master -b my-feature<br>
> +# work on new commits, add your 'Signed-off-by' lines to each<br>
> +git publish<br>
> +# more work, rebase on master, ...<br>
> +git publish # will send a v2<br>
> +</code>
> +</dl>
>  <dl>
>  <dt>When to use the virtio-comment mailing list:</dt>
>  <dd>
> --
> 2.42.0
>

