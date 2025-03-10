Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861D822A4E4
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612926; cv=none; b=k4Pb0ohzppw5WF6iQzL27azKOqHoInVa3DrXnXSMivyiL8ktaHa2M8XxwW3Wao/16MteBVEY/hvqb5LDnZBCH0fdDyfwcDZvmDB8LK//iGjRwfkWDBcnPb2Iq4zV8sfLqPr3qTU+Tsb327ZAZy+TIaU9qeNpIq8MHO5Kyk0P5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612926; c=relaxed/simple;
	bh=5vcmx2atjqJaNhMynDDU/jmkq6L60BB8WXTnccaB0R0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MvD8iuWu8RQoiOKfiTOUZzjWJmsrA6wrkZ++7G6FUKlwWFE1W/rcyS9l1K84s94Bri6yf70do0aTFcG+gqBsXDCodqMMnX6eqLildNHFDGOpGP7tfehUlE2LvELROogsDirnO32LbY3dp0TOa3VKDaycw93Hlzdy9drsy3reiqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACFlUuRR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACFlUuRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741612923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qXe2hA+1wOT6knSbRFv4Pma7Uu+/HXraHxN+lhmEVWw=;
	b=ACFlUuRRw3iScGDBLqR31GqvU0Stl12mFez2sqL+Yn++hsK2zK1c2Kf8/CvR80gxQZMLlN
	sZ8PKpEPuJ1E+jXocR0p88xVyz+kz+VK6jIQSLaHf02q1TWpgjU4/YKRj0pp8e5XJYGlMR
	7eVeIsSDcmjcvBDZcCwNEc0/GjVDsE0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-176-VG7dyGYhMCSY8BJzCvRlVQ-1; Mon,
 10 Mar 2025 09:22:01 -0400
X-MC-Unique: VG7dyGYhMCSY8BJzCvRlVQ-1
X-Mimecast-MFC-AGG-ID: VG7dyGYhMCSY8BJzCvRlVQ_1741612921
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EC341955DBA
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 13:22:01 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7536C1955BCB;
	Mon, 10 Mar 2025 13:22:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtio-comment@lists.linux.dev
Cc: aesteve@redhat.com, sgarzare@redhat.com, Matias Ezequiel Vara Larsen
 <mvaralar@redhat.com>
Subject: Re: [PATCH v3] git-publish: add profile
In-Reply-To: <20250305164546.1484029-1-mvaralar@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250305164546.1484029-1-mvaralar@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 10 Mar 2025 14:21:58 +0100
Message-ID: <87jz8xuikp.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4tZpf5OXHZPtC418fFWC_Cpbo6jDqqM5RJfYeS8hVXk_1741612921
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Wed, Mar 05 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrote:

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
>
> diff --git a/.gitpublish b/.gitpublish
> new file mode 100644
> index 0000000..d412896
> --- /dev/null
> +++ b/.gitpublish
> @@ -0,0 +1,3 @@
> +[gitpublishprofile "default"]
> +base = master
> +to = virtio-comment@lists.linux.dev
> diff --git a/README.md b/README.md
> index c06caf6..b521978 100644
> --- a/README.md
> +++ b/README.md
> @@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
>  git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
>  </code>
>  
> +<dl>Optionally, you can use <a
> +href="https://github.com/stefanha/git-publish">git-publish</a> to submit a
> +patch. This project already contains a <em>git-publish</em> profile that will
> +configure some fields, e.g., <em>To</em> field with the right address. After you have
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

Acked-by: Cornelia Huck <cohuck@redhat.com>

I think this can be done as an editorial update.

