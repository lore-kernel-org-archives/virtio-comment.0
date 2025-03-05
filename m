Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B57D23372D
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182204; cv=none; b=Gmau2q2sQMFzwFxVqxbfzvAdHiSBLcW4bEBctVR9FLsvkBRdElF7STBq+22HoNIIHh2bes6+Ym8SuwKraQVi9YscFd4oDaV1ZQ9xsi6rUN9JFgi6bhiqiYLaUJeMEVjoUZGNLiqUgFDJrmIBTOz2rzVK5wIVEbMBEI6sQAZwV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182204; c=relaxed/simple;
	bh=cCg/c7CymVYr4YsWdZLBpiBE5FRJq1S6QJG8wmqEak8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhX6hYIScJuzvzZQF6f+LXfdtXBRQD2OTfmIJo9XXyu8Iio6T9oyB0z6rv7crAfzqLqi1y3c3wHei+SBp0ZcMkyq4nUASdVomR/i43TlJK1tgYopQaf5aO8VYxWkuJvUhb15DmUrQlo6uKslFodFzWcJIy8ynYt0q9acVrp4tvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iraKbDcT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iraKbDcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741182200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qFpgIlGPtzM+DTrVdfo7Xf/Rsruot2xdYOSAALIE9ZI=;
	b=iraKbDcTdZmx43xWmfob4DDfBTYgnRriTOWk7bAxQL9OpqhpR/yt8CrmULM0aIrD2GWFAn
	ZEA3iQ4zFJDgvdEOr1+VYUk90/xivzznwtF7qUgIzokKE49QVKH6ja7/QgwaC9b1dvrZrZ
	mw2E32y/YTSN6QGB2w0XLT2A9sN61BA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-Raeq3yfCPkeF89QyU-tpWw-1; Wed, 05 Mar 2025 08:43:18 -0500
X-MC-Unique: Raeq3yfCPkeF89QyU-tpWw-1
X-Mimecast-MFC-AGG-ID: Raeq3yfCPkeF89QyU-tpWw_1741182198
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so435064a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 05:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741182197; x=1741786997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFpgIlGPtzM+DTrVdfo7Xf/Rsruot2xdYOSAALIE9ZI=;
        b=TMGlhp7ZjAaVd6PhSo+Cc6csgR2MdM3H/2N6zFZ2p5sIeXadBDwiu2IlC1rpYKa6+5
         V9kfJBrfLrfq8fvDqFPjelYo1IPrm+q9JZub7X1poa/cuQOiF9siPvJQpRBmEPYhrBm2
         ZQ1hp3MsEbmAuT8nRTQ4E/vVQQRLjCGnoCXRrxSp7VR3UHJZWUS+6QllYJl6fynu0aIl
         0AvVjpUy4DKRXwA3ozIT1DwYlj9ftcUNphhaBHn008YzZbxZHm2n3NlgT53yQgSl4FAJ
         Sy3GtRYr4vap2Mkfo1855boqhC+WS6KGH6trdBNys0XBuvQee39UbnsozHovQLZS9FEc
         ggbg==
X-Gm-Message-State: AOJu0YwrDR2u0Jic6CJQVzMmB6dmcSXntr9IVpC4fm3wNLAtoCEftf4z
	IexdWJEd6fqK9DW+JyNyBum8i49Rd5pRJwJRRntZuD7nBL4sDosWrQJ1WjX9t+yHJkvc/NOcENw
	KqUsv3Y+ul/u48/hrpyixn/07rENDOvwR/0bcLSDBii16DM2ZxJ/JoW+LVTZK5Fvn2XE88iPH9a
	HO/QGMGkEva2JXX7WNuEj17rvsxZ7s1Mo5pB+VeSk=
X-Gm-Gg: ASbGncuw6YhxPkkpuvEdmw3uCD2w2jRbHAeWKpZXOzZU8hmr46XSbKJU8EJmdK/ZRtv
	wRatJ709myEi39XU4lxeHmk0emqqYrV8u1ICy0Q9BKbhzTX1bV+LEUHTPaNIF5EIlHpTF/V2N/T
	A=
X-Received: by 2002:a17:90b:2685:b0:2fe:8282:cb9d with SMTP id 98e67ed59e1d1-2ff497ff871mr5000466a91.28.1741182197505;
        Wed, 05 Mar 2025 05:43:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/469ym0TbElJE8NCThJP3/oQF5g1PpdDcTClKZNHM0o7DrMd3nUQI4c/npngF7Mw0hRdM6xzjA/F4Liq4P9E=
X-Received: by 2002:a17:90b:2685:b0:2fe:8282:cb9d with SMTP id
 98e67ed59e1d1-2ff497ff871mr5000439a91.28.1741182197044; Wed, 05 Mar 2025
 05:43:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250305105751.1472050-1-mvaralar@redhat.com>
In-Reply-To: <20250305105751.1472050-1-mvaralar@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 5 Mar 2025 14:43:05 +0100
X-Gm-Features: AQ5f1JoPNJFoqodplotRuyvQ-9Ecd3TOXVpm1TaQTXPOZsJY-fUnD3LiX-EbHpg
Message-ID: <CADSE00LLtG04SHmCp1+DuOsc+E3QqA-BDp=FuhCmAO_uvb_+2g@mail.gmail.com>
Subject: Re: [PATCH v2] git-publish: add profile
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sDyCsVke1sC5KVOagl4MsG0FXFTHCBs4bsVREOeMjBM_1741182198
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 11:58=E2=80=AFAM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Add git-publish profile and document how to use it.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v1 -> v2:
>    * add link to git-publish
>    * document that the project contain a profile already
> ---
>  .gitpublish |  3 +++
>  README.md   | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 .gitpublish
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
> index c06caf6..3df3fb2 100644
> --- a/README.md
> +++ b/README.md
> @@ -110,6 +110,19 @@ git format-patch -o proposal1/ HEAD~1..<br>
>  git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-*
>  </code>
>
> +<dl>Optionally, you can use
> +<A
> +HREF=3D"https://github.com/stefanha/git-publish">git-publish</A> to subm=
it a patch. This project already contains a git-publish's profile that will=
 configure some fields, i.e., To field with the right address. After you ha=
ve installed git-publish, the procedure is the following:

Nit: remove uppercase and the line split? Also, you could use acute
accents surrounding the `To` field, to highlight it in the markdown.
Also, not sure that the genitive is correct there for `git-publish's
pofile`. And if you want to give an example, better use `e.g.` instead
of `i.e.`. So all in all, something like this maybe?

<a href=3D"https://github.com/stefanha/git-publish">git-publish</a> to
submit a patch. This project already contains a `git-publish` profile
that will configure some fields, e.g., `To` field with the right
address. After you have installed `git-publish`, the procedure is the
following:

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

