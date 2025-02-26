Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D543928F3
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586057; cv=none; b=fdoIjez/ArFvJHlrrGRz+CsUXJhi1jhgj4hPaddh21uf7iY/y++13OW3vyIESt4cccc2ibetK/j7VVqDk5ZX6h78LI92gJGpAdm30jsk6S6Hs3Yqk5TkwGHz3zGv+YD/v+pcvOeKXMgW2j1oWIHMFRxw7PBk2C+IByB6TWCJoy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586057; c=relaxed/simple;
	bh=tT/BE0cRTE4PDXiusuHDMShDMIjYu1Z55bFVV+wBcqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d/LBwSQ7nUbJ8XVdFdgxaLHw7jnW+p4mfaFExoFlukZfG93pUm0s71eVrV/49GBMspgDoVs2lLD61uv4YDieIP3+uIBPuysDn+AquDwlcWoqz2FgSMil02/mp7v7UrF1atGC7FnxtqfsJnMv+zKmqjufS12Ix9K/dRd8v5OdnkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=APjQqG2l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="APjQqG2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740586054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c6JMkBp1RlaE2mZJ5xc6TQ19HD8wwOuBrkU0OoLsn/g=;
	b=APjQqG2lyxQxAPqhgWVPOLnxcHk4XBWJUjwO7U6xNx2fuBSUcUzUFA91J9x/REB3QZLyxd
	+lVg+FUKiqn9rxB2IETRjLYtEwnOXQ+L7qCLPjm95bNqCP/itBiln6+WGTUdoum/mKitsl
	+U4z9EbaaJSMef5S2BxeAuj6DCHZ61I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168-AtFfJkbpM5SjRwc2wYKdNA-1; Wed,
 26 Feb 2025 11:07:31 -0500
X-MC-Unique: AtFfJkbpM5SjRwc2wYKdNA-1
X-Mimecast-MFC-AGG-ID: AtFfJkbpM5SjRwc2wYKdNA_1740586050
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 41041190F9F1;
	Wed, 26 Feb 2025 16:07:30 +0000 (UTC)
Received: from localhost (unknown [10.44.32.208])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A760180035F;
	Wed, 26 Feb 2025 16:07:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtio-comment@lists.linux.dev
Cc: parav@nvidia.com, mst@redhat.com, Matias Ezequiel Vara Larsen
 <mvaralar@redhat.com>
Subject: Re: [PATCH] README.md: add example email for TC vote request
In-Reply-To: <20250226153318.1243033-1-mvaralar@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250226153318.1243033-1-mvaralar@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 26 Feb 2025 17:07:26 +0100
Message-ID: <87plj43d1d.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 630vdXnpvgbtWnuLFsuBiLbm2DAPLXizjL7dbpZjE24_1740586050
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Wed, Feb 26 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrote:

> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  README.md | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/README.md b/README.md
> index c06caf6..5f76e0d 100644
> --- a/README.md
> +++ b/README.md
> @@ -206,7 +206,13 @@ The mail requesting the vote should include the following, on a line by itself:<
>  <code>
>  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>  </code>
> -(NNN is the issue number)</li>
> +(NNN is the issue number)<br>
> +For example, you can use the following template when requesting the TC vote:<br>
> +<code>
> +Could please open a voting ballot for these changes?
> +
> +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> +</code></li>
>  <li>Please make sure to allow time for review between posting a comment
>  and asking for a vote. </li>
>  </ol>
>
> base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2

Acked-by: Cornelia Huck <cohuck@redhat.com>

