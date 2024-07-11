Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB916A94A
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 14:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709108; cv=none; b=OTX8hF/C4MeKdIx88iJ2n7DZ4zDi80slNS207IU5RWv9ilPPn53zWaLNx8rd6jDbsw2ucaIzPrHeG7wUyspprwCKIzbaF9FiVPLRsgRKxBX2hlHWpGoHUad9KglseNHeApPEGa4miQ+B3hReSnQQ5bxWuXX9Tjp/GTI7q6YUqHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709108; c=relaxed/simple;
	bh=ck4wz3zVjJmFKArGdJ6lcTZv+LyYXeOKpr+/kqnyFio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dy/SkN4df9ftGQr3AAx7PRqveqNYRHrQTi6vxF5hiuw7nQAml0/4w5WJVRmF1JtmZor1u5XGvUtomqpLw4J0VckaUju8GnuzxMn/Ue7uPba6iB/6eHaHf/13Xx6zX+K/Z2GadTK7cm1PObYQGVhFYE1r/9J5kkkysLsBjk9u/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C5RDdYE/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C5RDdYE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720709105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ck4wz3zVjJmFKArGdJ6lcTZv+LyYXeOKpr+/kqnyFio=;
	b=C5RDdYE/e+c/0JwxzmE3dlVnT7Roam2C4cXS78evYErp670ZDPnYcpqAAPU0cTXIqiLcGi
	GD4lj0X2yhaknd7xsMGyMpOb2upAz/6JLQTyF+UOkVDJ3nM8YtB+IHwc16TBJaeMT4FJ25
	Hcy8VHBb7iE2p1Q5L8nM3uyiRXO9a0s=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-kfrX138CMn-fY4lDFXyofA-1; Thu,
 11 Jul 2024 10:45:02 -0400
X-MC-Unique: kfrX138CMn-fY4lDFXyofA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C6AF196E094;
	Thu, 11 Jul 2024 14:44:59 +0000 (UTC)
Received: from localhost (unknown [10.22.32.66])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E1991955F3B;
	Thu, 11 Jul 2024 14:44:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Parav Pandit <parav@nvidia.com>, Matias
 Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
In-Reply-To: <20240711103014-mutt-send-email-mst@kernel.org>
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
 <87wmlsb0m1.fsf@redhat.com>
 <20240711103014-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 11 Jul 2024 16:44:55 +0200
Message-ID: <87ttgwasyg.fsf@redhat.com>
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

> On Thu, Jul 11, 2024 at 01:59:34PM +0200, Cornelia Huck wrote:
>> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>=20
>> > On Thu, Jul 11, 2024 at 01:46:19PM +0200, Cornelia Huck wrote:
>> >> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> >>=20
>> >> > On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
>> >> >> The virtio documentation currently doesn't define any generic
>> >> >> requirements that are applicable to all transports. They can be us=
eful
>> >> >> while adding support for a new transport.
>> >> >>=20
>> >> >> This commit tries to define the same under a new Appendix section.
>> >> >>=20
>> >> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> >> >> ---
>> >> >
>> >> > I am not sure what is this supposed doing - just listing basic thin=
gs
>> >> > transport does or all things it can do?
>> >> >
>> >> > If the later, this ignores several things that transports can do,
>> >> > such as shared memory, data in notification, etc.
>> >>=20
>> >> Maybe split this up?
>> >>=20
>> >> A transport needs to implement the following:
>> >> <list of mandatory things>
>> >>=20
>> >> A transport is encouraged to implement the following:
>> >> <list of non-mandatory, but strongly suggested things>
>> >
>> > Some things just depend on feature bits, and a transport
>> > can make a feature bit mandatory if it wants to.
>>=20
>> I wasn't thinking about mandatory for a device/driver, but mandatory for
>> a transport (e.g. stuff like per-queue reset which is not mandatory for
>> a transport to implement.)
>
> Same thing really.
> For example, queue reset is controlled by VIRTIO_F_RING_RESET

Well, it is -- but a transport can choose not to implement the feature
bit. I guess what I'd like to do is to set expectations: every transport
needs e.g. some way to do notifications, but it can skip some other
things like "device discovery", for example. I think the appendix is
intended as a reference for someone wanting to design a transport, and
some kind of laundry list would help there.

