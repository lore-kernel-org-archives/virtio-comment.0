Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF92904
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698394; cv=none; b=CpkUoejfwLpOKTffiaWdHpe75dy2Vhje4cJ+3JsKbSgbn+Dduc3wPInZKK7wfAm9zwNMVZjXqqvU6lFS89j5FMYUzKgo2druH84RchtYwVOkQEBCd5TbfqmtDi0XlqnOmuH7ohhbSayNdlhuFcWRgEXVOT/UygtJrUn8IJ9hTg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698394; c=relaxed/simple;
	bh=mVKJOfDXi0yQz3jyILro3zTrI6XFsR80Yk2WbbRLmy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DXvEL2YBwFuIXI+rGTwgALWELokTl8MXdax2lUtklgzlCI0IYoVa7ZYuEpVVowLUXVuFjixqd0IB5m6Oyr+VbhkZruAgejDyVrm533KILEGdY6zbDXAwnkrzxX6aLyjYnKsuDeGKNbrGXHc692fDqdZxtSEasjIKIJaDVUeWaB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NKf6tb3T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NKf6tb3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720698389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVKJOfDXi0yQz3jyILro3zTrI6XFsR80Yk2WbbRLmy0=;
	b=NKf6tb3TLUvEnR0Saby+3vc3DsIbXmNzvSHpLqSGX5nF0moBbmeUwD1cgjwulrAOvapSrU
	U8pDIDV14dkAjDi3k76eViozCGwzPD3QtRl81PLrpw55WGZSHEyPI/4dL/uV+pA25RvNQe
	jynhbLzYT44ZtuMitMTvgelqTi//PbE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-a5sg2mk5M7-23Yv4FKvRNw-1; Thu,
 11 Jul 2024 07:46:24 -0400
X-MC-Unique: a5sg2mk5M7-23Yv4FKvRNw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BB071956088;
	Thu, 11 Jul 2024 11:46:23 +0000 (UTC)
Received: from localhost (unknown [10.22.32.66])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E7A61955F3B;
	Thu, 11 Jul 2024 11:46:21 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar
 <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev, Vincent Guittot
 <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Manos
 Pitsidianakis <manos.pitsidianakis@linaro.org>, Parav Pandit
 <parav@nvidia.com>, Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
In-Reply-To: <20240711070740-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240711070740-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 11 Jul 2024 13:46:19 +0200
Message-ID: <87zfqob184.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
>> The virtio documentation currently doesn't define any generic
>> requirements that are applicable to all transports. They can be useful
>> while adding support for a new transport.
>>=20
>> This commit tries to define the same under a new Appendix section.
>>=20
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> ---
>
> I am not sure what is this supposed doing - just listing basic things
> transport does or all things it can do?
>
> If the later, this ignores several things that transports can do,
> such as shared memory, data in notification, etc.

Maybe split this up?

A transport needs to implement the following:
<list of mandatory things>

A transport is encouraged to implement the following:
<list of non-mandatory, but strongly suggested things>

