Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C79156993
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699184; cv=none; b=KSHxrmIukokutqbRghnLfycwbrxcO9LIKSOJ1d9ebINEZlFq5krdFI6Qk34X2lu06cad5qq4UgUO5d08q30jQGXFG3/+19WuTxGg/+wBdWENpafgfXL/a+44MP5YFPtDgrbidw0pHkyanZAnhSMSHnRjS+PwlAMp8HRjzhvKIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699184; c=relaxed/simple;
	bh=MmpRVfLUaGZ3D4jBOzGOH2SNlkFlh9iTmRkvqNJhIv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F4KobpmZvqhkwVmbi1h6LnNUFn7LwmkWE5ZJVvyxVqZ0jAqqH+cfYPfpxifTm6GqzHHsDqFXymJH72+gY/AYiNwK2I3E8U+XPIc9WzJ8le3vVp/oJEUW8X4tvC+swD/TJOFioKpsI65WiMu12UMg+f623yxkDVgZ6thMgAbVXR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xz7aJBAC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xz7aJBAC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720699181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmpRVfLUaGZ3D4jBOzGOH2SNlkFlh9iTmRkvqNJhIv4=;
	b=Xz7aJBAC+kidzoCc2NLr2H1e+Hv6gBjRMtnTco7tttnYaF+ptzzy/4O0sid2lkdDfD58sC
	ll06UV3qkpgeNCZkd+aFdgPDRkzA7VvYgF1IZwZcvnIXQjDvGA0iX1l2txPS/jfCN1YcdV
	05mnT05a+odP/i2upvXzvXwfpDAlCbc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-56-sWrwZAtjOjWyyrhq3xPxPA-1; Thu,
 11 Jul 2024 07:59:38 -0400
X-MC-Unique: sWrwZAtjOjWyyrhq3xPxPA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4209F195609D;
	Thu, 11 Jul 2024 11:59:37 +0000 (UTC)
Received: from localhost (unknown [10.22.32.66])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88B311955F40;
	Thu, 11 Jul 2024 11:59:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Parav Pandit <parav@nvidia.com>, Matias
 Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
In-Reply-To: <20240711074942-mutt-send-email-mst@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <279db14c105666b4e2c9c71dede31592947dd9f5.1720683975.git.viresh.kumar@linaro.org>
 <20240711070740-mutt-send-email-mst@kernel.org>
 <87zfqob184.fsf@redhat.com>
 <20240711074942-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 11 Jul 2024 13:59:34 +0200
Message-ID: <87wmlsb0m1.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 11, 2024 at 01:46:19PM +0200, Cornelia Huck wrote:
>> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>=20
>> > On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
>> >> The virtio documentation currently doesn't define any generic
>> >> requirements that are applicable to all transports. They can be usefu=
l
>> >> while adding support for a new transport.
>> >>=20
>> >> This commit tries to define the same under a new Appendix section.
>> >>=20
>> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> >> ---
>> >
>> > I am not sure what is this supposed doing - just listing basic things
>> > transport does or all things it can do?
>> >
>> > If the later, this ignores several things that transports can do,
>> > such as shared memory, data in notification, etc.
>>=20
>> Maybe split this up?
>>=20
>> A transport needs to implement the following:
>> <list of mandatory things>
>>=20
>> A transport is encouraged to implement the following:
>> <list of non-mandatory, but strongly suggested things>
>
> Some things just depend on feature bits, and a transport
> can make a feature bit mandatory if it wants to.

I wasn't thinking about mandatory for a device/driver, but mandatory for
a transport (e.g. stuff like per-queue reset which is not mandatory for
a transport to implement.)

