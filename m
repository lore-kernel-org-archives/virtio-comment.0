Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713F81A073F
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012879; cv=none; b=tj2aReNLU3kcc16KUAr3Z8BoduP1iSsKkr6z8IeOwUrHhvHNegytUk5IPp/c1WUlzKsuUlPZdoT1boCx/meukZnM2CLn5FSe0vk1Rot1BDA3BCBlsdpHe5MdoxOcA70p16zjIkJimYYllc5ckpBEbGNIn79wkrb0o3G65v67W90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012879; c=relaxed/simple;
	bh=GpYsXyvFugKqmxSAE7wFD3c4y3EG4bEE1j/d5SJIcFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c+mfJliB3EbLvM580N3SzX3DD5PIr6dTjk7prj42Vapm4lXJxJTqBtgiqLUEuM/aPoUcYthMrfX8INtDL5Wxgh8VNIsyy8jGPd+kXKkO8ahz88m9jafFRSq2j0cyaDr7Ei+PGW1nxVbDSc6aCOeOnrIlUS6g0d2WjY45/9dNxR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dz5qpwnZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dz5qpwnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751012876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GpYsXyvFugKqmxSAE7wFD3c4y3EG4bEE1j/d5SJIcFs=;
	b=dz5qpwnZXBdBvqQpc6/QNFrN6HWjLkFkxkczhxma/YfPDq0RNQE29Q+sMMwPywJszumobK
	6ISGA4sBkKYIucQx27+ONrKUhR6SxgOGT4/PxXYncq9OEfKH5TvHlA/kWLXxHIAjtfWRXl
	HE2fFrvqkCaJQewxLnnH0AV2M7kw65Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-10y5-TCVM4qnaAYq640ijA-1; Fri,
 27 Jun 2025 04:27:52 -0400
X-MC-Unique: 10y5-TCVM4qnaAYq640ijA-1
X-Mimecast-MFC-AGG-ID: 10y5-TCVM4qnaAYq640ijA_1751012871
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A91381801216;
	Fri, 27 Jun 2025 08:27:51 +0000 (UTC)
Received: from localhost (mschlens-int.str.redhat.com [10.33.192.203])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6803B1956095;
	Fri, 27 Jun 2025 08:27:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@amd.com>, Parav Pandit <parav@nvidia.com>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
In-Reply-To: <e0115f0c-951f-4a76-8795-d34b6f088467@amd.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <092e01c6-1756-4293-8183-8efea6720548@amd.com> <87pleqh5l3.fsf@redhat.com>
 <e0115f0c-951f-4a76-8795-d34b6f088467@amd.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 27 Jun 2025 10:27:47 +0200
Message-ID: <87ms9th9mk.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ht5BDHI5JQ08vEyceCzc9Lakm2B16SZReJkwgzhupGU_1751012871
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Fri, Jun 27 2025, "Zhu, Lingshan" <lingshan.zhu@amd.com> wrote:

> On 6/26/2025 11:42 PM, Cornelia Huck wrote:
>
>> The intention is to use them in normative statements only, so that
>> implementers have clear guidelines on the requirements. The legacy
>> sections are arguably a special case (for implementers who want to
>> support legacy implementations.) I don't think we want the all-caps key
>> words leaking into other sections (any more than what might have
>> happened already.)
>
> so this is a new requirement, we need to document these guidance

Not new, but not documented, either. I see that Parav is already
tackling the latter part (thanks!)

