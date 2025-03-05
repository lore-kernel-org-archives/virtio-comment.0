Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96092E3360
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741161916; cv=none; b=G1d6qEzkE44mcYSP5oepbRdlCml2fA0EikFTXiN+dpSwfoWZ39jA0rJp9sy/jQL8q4RFWBiSY0vA8rUDh6B6bMNwdPt43K2cthS39zLplJKs/fVKpaAPMOM93gDB/OqVECyl6pKkpxjGvRu3nmlg++4O7wFhMv9dI/3rK06vA2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741161916; c=relaxed/simple;
	bh=FRG9o2XJe3yv7+g1gk57/SAV8XfJqpW35FWEb5pwIXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pX8RGKgmwGg341auwF4UMmrjKKSotoCIIKUfr+Q0v7ZJ5K0Lr2LMZER1mKATkQzv34l9S1unX4LaKu+5ZXPMlPgX1EAbKy5qRNh6oQMNly74tAy4VjLTa8NVbsdbqii4cmCthkY3La3muvyEZBwpzJ/iBNmi8rvszaXO9fSxlVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bp5EC2H5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bp5EC2H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741161913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C2hXXK5UrZhFMSotrqOTpI8iz+6BqOCOmYt6SchKciM=;
	b=bp5EC2H5+Q8G7Y307xVuScS0KwpLtLCbCe3BLXx9KPit85Ky4qCtrvlxam9E79ta85e3s5
	qThTeKVqQnXVlHQZchC3KdavN/429oIzve3dTiVSVKfmdSwlgHQS/nNF1XfbKA75nZNf9T
	KqDpkcM4HEEGcr5oKr/aiQsDXY9Wf/4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-4u4xm6lzMiOGaaRYg2wbqw-1; Wed, 05 Mar 2025 03:05:12 -0500
X-MC-Unique: 4u4xm6lzMiOGaaRYg2wbqw-1
X-Mimecast-MFC-AGG-ID: 4u4xm6lzMiOGaaRYg2wbqw_1741161911
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fee7f85d03so11356357a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 00:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741161911; x=1741766711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2hXXK5UrZhFMSotrqOTpI8iz+6BqOCOmYt6SchKciM=;
        b=at0lbOXT9cfbt8Pd9DtvZc2Tkqzllm7Wm7MpiQPepeUq6GgKwPsSEJalFj5xncwU9s
         yDlMPbTVOfpGLROR87lvJAcjM5E+ebLrMlTWVC9fSjyesI8rBwjCrxwAE5z7WOqYvRQ4
         TrjVZ6DWF+BEIProele0H6wurr4RJwogPO0lXzVdUira2n6mRYxh4JHb0QfqsJPoiY4F
         dyinYiWTGAsurwFwW8BT/258QjMUTF5SVWF5oRJzelNpBoyJ5KENjJ5JjAcRHqycYgVl
         HvUsyQ9DQkvMpGtqk/4M51znNfnphmvjp4U252303QtYcHhZ4MpLFSZW4dHV4oshB5IN
         S/tA==
X-Gm-Message-State: AOJu0Yx+lktyNtbjKlVjmMNTldcfb/4khK3lt3/wTaKWr0UDnqLQPRCx
	FdPvHF/0dv5IrfVS0QmLmTb9x3c/0bLRktADcDwUP4kqhg1t2k50lbv8eMzqFeTo6Z8jA0i5PHa
	+TEWAAuZQ/EAK37QAqmMaYXGapWYM2Jqs8OqGomdU3PVp9UtRoj04/gKsG1qoXZ+CfEX58VxCUq
	f+bSfUQtJU4dYYbX1ErxIPUwi5b2qwmqqfu4Ar/Ik=
X-Gm-Gg: ASbGncv+4VQllbSFuqMiuYdtPrxegTIcBxVFNUwHT+DnQzkvothdMW5ZV8wSXBG6cXU
	UZyF27L5ljLLD4T3JA1F7wCjWeKsjYuqwmkwwc+r7Wb3scf/7PN91+EY4ZUsP/NJ9Mvht5W1Ym9
	I=
X-Received: by 2002:a17:90a:d2c3:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-2ff52b8281cmr826706a91.19.1741161910990;
        Wed, 05 Mar 2025 00:05:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE61h096JAWjD32TBmAJcBJM5GkanFAsPhkdpiRpPCOBR91q1PLxQdb5nVm9QzT5BC8sHSek+Pbw+f0P0ALx9o=
X-Received: by 2002:a17:90a:d2c3:b0:2ff:52b8:2767 with SMTP id
 98e67ed59e1d1-2ff52b8281cmr826688a91.19.1741161910663; Wed, 05 Mar 2025
 00:05:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304161113.1445602-1-mvaralar@redhat.com>
In-Reply-To: <20250304161113.1445602-1-mvaralar@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 5 Mar 2025 09:04:59 +0100
X-Gm-Features: AQ5f1Jq1bH-2YzQNXJjUVRHLTMlc3ojUnI8mQ3xHfkxsrEj7obXo4y-n6XJk2Oc
Message-ID: <CADSE00JHFcsg2vHVOymDd9pawbGWPiBOpZ1guRivAOOOK33xKQ@mail.gmail.com>
Subject: Re: [PATCH] git-publish: add profile
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DMV7TZTjp_WCXwWy564KdAk9hTSM5zkaIUjCZtJoUkU_1741161911
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 7:47=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> Add git-publish profile and document how to use it.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  .gitpublish | 3 +++
>  README.md   | 9 +++++++++
>  2 files changed, 12 insertions(+)
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
> index c06caf6..39f22d4 100644
> --- a/README.md
> +++ b/README.md
> @@ -110,6 +110,15 @@ git format-patch -o proposal1/ HEAD~1..<br>
>  git send-email --to=3Dvirtio-comment@lists.linux.dev proposal1/0001-*
>  </code>
>
> +<dl>Optionally, you can use git-publisher to submit a patch. The procedu=
re is the following:

s/git-publisher/git-publish/ ?

Maybe even worth adding a link to the project repository?
```
\href{https://github.com/stefanha/git-publish}{git-publish}
```
Especially since you need to install and set up the tool beforehand,
so it is nice to have the link pointing to the project documentation.

> +<code>
> +git checkout master -b my-feature<br>
> +# work on new commits, add your 'Signed-off-by' lines to each<br>
> +git publish<br>

The first run (unless you pre-configure your profile in the project
git config) needs to specify the recipient (with --to) and and cc's.
I'd add at least the `--to` to the example.

> +... more work, rebase on master, ...<br>
> +git publish # will send a v2<br>
> +</code>
> +</dl>
>  <dl>
>  <dt>When to use the virtio-comment mailing list:</dt>
>  <dd>
> --
> 2.42.0
>
>

