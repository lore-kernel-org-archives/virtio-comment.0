Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FE67EF09
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781150; cv=none; b=jGByvVJwZv5rdLS+RyEWbxPkRO3SdrY6jGbCq8/91vSD0SJK3omXMjzSZGK/hn5rVZOD30c8Gz1gJfoyjXxYfhyoozRcLc9oZWm+1gqKt7xuUs4oHTUFd27GjDBniWq+iBs/s1FV0ukE3HFNF+mnvY6Z0ajokyOoxht4HE8QQvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781150; c=relaxed/simple;
	bh=IWHgCNsNZFKlZSyusG70LCdjq5cfS4OVytwPIJyIuhY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lghp+zezC9vkix/DQ+sfu9+/+E7Hxhe3OjmimfX7VjrkNLbGD85Ny+f1PnaNIL1Ku+Hm9kSrA9NsyiXzR8/BWTLWf9H0La2Zb2LTytBr/u/V8noADjvFjyqhxoxLYdfOVTlazYI/NT+yrqLjKGxk+tC5mvFVFJ71Vi/KfyCv/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ww0V9oEK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ww0V9oEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720781148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8+/P3Ny9C/RUR82Ab2rWJ26+GDrV5a0Yi3b1m7HEFs=;
	b=Ww0V9oEK2KWXiIEuKk9Tj0aVR9VLjCCAwVvX5Wh+d8PQ1TTI2OCV6t94tjf1LtuAQvidcc
	c9bkkaprdSoTyPHlbcQDbFRulUcRZZP+FT9AkiTRghCLxsnlmBshFAfGA/OlYnYvwtOqxC
	i3PvLywiwYYGey4pCgiZynfgqe8iF1k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-HuQy-zxnO7GeXbZuwETHJg-1; Fri,
 12 Jul 2024 06:45:44 -0400
X-MC-Unique: HuQy-zxnO7GeXbZuwETHJg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F02F19560B1;
	Fri, 12 Jul 2024 10:45:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.17])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A34341955E85;
	Fri, 12 Jul 2024 10:45:42 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <pandit.parav@gmail.com>, virtio-comment@lists.linux.dev,
 mst@redhat.com
Cc: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH] editorial: replace hyperref with ref
In-Reply-To: <20240712041433.3246718-1-parav@nvidia.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240712041433.3246718-1-parav@nvidia.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 12 Jul 2024 12:45:40 +0200
Message-ID: <87le26c2i3.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, Jul 12 2024, Parav Pandit <pandit.parav@gmail.com> wrote:

> Replace hyperreference with the reference.
> Fix the broken link refernce for the DEVICE_STATUS part.
>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  admin-cmds-device-parts.tex     |  6 +++---
>  admin-cmds-resource-objects.tex |  2 +-
>  device-parts.tex                | 19 ++++++++++---------
>  3 files changed, 14 insertions(+), 13 deletions(-)

What is this patch against?

