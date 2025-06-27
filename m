Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4D14A82
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012958; cv=none; b=KeIDab0Tf5bWSSm+D/pW3UEshbFVWdUpxznj3vxFWHxIaRYY0pDVYJh80KW7V8iF3WeVjbh3ecr+S/TvMPyPzPUDHObLNu/ocLZjrjY1CDibehIW1lX6ZfVA2ctB100hddWhuwRPlMLuRi5haGKzO78xn8Mbni8k2LaTDoXEdU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012958; c=relaxed/simple;
	bh=PQruTu9e5ui2NRwGBBgHfOezZPe1PM+fVevzGRh26i4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RRkLnp2tBnSaUt/jygGz8d//vcAJoRl62qmmdtSMGxTORrI97ooWgiI3nSWRAWmEZfb6kEJ+VAywFvPU5X/st5PFxFl1kj24JeXSFOhsMRXYaW+HOdqOqSuM+m9zTzp3ZQX2V/EaeRVY7LnlkBrzpwoZC5pMr4zD0qlFwnQ+vaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fQzoUCW3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fQzoUCW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751012955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZ/l44sBDSs0UBValr8CC0NzDGIzoQpMG7JGdH1Zqsg=;
	b=fQzoUCW3ZmuyylInXjg8uFyW0Bi1i0/3/Eug/UC2fdN1WhQ+O3UMRntn7Mg3OIIoSQ/l62
	OURvSCD/9mQncd04rBiO/J/kwSjNOHM/xDcCpW2rfpkBHNc+GEKhwWr0fIUqCLQNNLNJ/E
	aM2WjIuuGfoCKNwDiaJdl/TCrFBtDbw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-D_HakhLONninB0DJ_UAcew-1; Fri,
 27 Jun 2025 04:29:12 -0400
X-MC-Unique: D_HakhLONninB0DJ_UAcew-1
X-Mimecast-MFC-AGG-ID: D_HakhLONninB0DJ_UAcew_1751012951
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B4CA51808985;
	Fri, 27 Jun 2025 08:29:11 +0000 (UTC)
Received: from localhost (mschlens-int.str.redhat.com [10.33.192.203])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BCE21956095;
	Fri, 27 Jun 2025 08:29:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
 mst@redhat.com, mvaralar@redhat.com
Cc: shahafs@nvidia.com, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] introduction: Clarify RFC 2119 key words usage
In-Reply-To: <20250627041954.400922-1-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250627041954.400922-1-parav@nvidia.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 27 Jun 2025 10:29:08 +0200
Message-ID: <87jz4xh9kb.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: znNZxrRpl8wdof8aWeJ63eUX0L8gmScTeL8AXyAb3MI_1751012951
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, Jun 27 2025, Parav Pandit <parav@nvidia.com> wrote:

> RFC 2119 key words should be used in Requirements and Conformance
> sections; these key words to be avoided in rest of the sections.
>
> The motivations for such clarity are:
>
> 1. To clarify the intent:
> These key words carry precise semantic weight. When a spec says MUST,
> it means compliance is not optional. Using such terms in general or
> explanatory text risks misinterpreting guidance as a requirement.
>
> 2. Avoiding Ambiguity:
> If normative language is used in non-normative (informative) sections,
> it becomes unclear whether the reader is required to follow it or
> if it's just background or suggestion.
>
> 3. Informative sections explain context, rationale, or examples.
> Normative sections define rules. Mixing the two muddies the structure
> and weakens the authority of the normative part.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/230
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  introduction.tex | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

