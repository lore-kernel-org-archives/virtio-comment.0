Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B3B12DDA9
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709976; cv=none; b=DM69nbBk2GqKn3uG7CX6G/qKU9fxIP/Sj/J8oYGeHDUOBrnVMaov7vc4BnjaL68OU/DgdiFQ9eiNRhU4I6tVOGVcQ1EZ8xqbEKPexirDViFJPiESpM+g4pk7+ueq3g8WiqPHSt/Ab+tUxFazBz7q3J4DlHDMTBveV8GbMSOsxzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709976; c=relaxed/simple;
	bh=4CuytYGWxop9eAcIa6p/8qpsPWZV/sx6JByCVnWLnEs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g7QYUj007Pgf36ffcm0PKuFLNl5F/2wMCai/m+KCEaet0n3AI0kB0NnMydy/4ai7EHMpfZYzotIenxgC31+bz4cRpttspB4dIt+hkrEZPTSwLOSnVz8y2i8xstqfDqbMNv7O35XBwsyGnEQeduvhPT/Cj23zD/UaNeT37Z9l8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QRaToxQB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QRaToxQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720709974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CuytYGWxop9eAcIa6p/8qpsPWZV/sx6JByCVnWLnEs=;
	b=QRaToxQBfUcqArUzL3XocZEJHzvLk/4FiLslFqpkm5mGnyrY4OGg94c++5BN0jNyR0GyUy
	Lq668b4J+uBOX9ImNEN8RZMueFqzazZAqWMCcsuTjERO8AX6eSrojTp1cc+dSvFAkPkw6n
	VAJNNcCCI3rvrJnKGTMhCmj8yF0Tyn4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-w4XqLiviM-6OVXuYYX5ZAA-1; Thu,
 11 Jul 2024 10:59:26 -0400
X-MC-Unique: w4XqLiviM-6OVXuYYX5ZAA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22950196CE02;
	Thu, 11 Jul 2024 14:59:25 +0000 (UTC)
Received: from localhost (unknown [10.22.32.66])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A6EB195606C;
	Thu, 11 Jul 2024 14:59:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.linux.dev,
 Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Parav Pandit <parav@nvidia.com>, Matias
 Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V7] virtio-transport: Add a new section to clarify
 transport requirements
In-Reply-To: <20240711104702-mutt-send-email-mst@kernel.org>
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
 <87ttgwasyg.fsf@redhat.com>
 <20240711104702-mutt-send-email-mst@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 11 Jul 2024 16:59:21 +0200
Message-ID: <87r0c0asae.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Jul 11, 2024 at 04:44:55PM +0200, Cornelia Huck wrote:
>> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>=20
>> > On Thu, Jul 11, 2024 at 01:59:34PM +0200, Cornelia Huck wrote:
>> >> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> >>=20
>> >> > On Thu, Jul 11, 2024 at 01:46:19PM +0200, Cornelia Huck wrote:
>> >> >> On Thu, Jul 11 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>> >> >>=20
>> >> >> > On Thu, Jul 11, 2024 at 01:18:18PM +0530, Viresh Kumar wrote:
>> >> >> >> The virtio documentation currently doesn't define any generic
>> >> >> >> requirements that are applicable to all transports. They can be=
 useful
>> >> >> >> while adding support for a new transport.
>> >> >> >>=20
>> >> >> >> This commit tries to define the same under a new Appendix secti=
on.
>> >> >> >>=20
>> >> >> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> >> >> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> >> >> >> ---
>> >> >> >
>> >> >> > I am not sure what is this supposed doing - just listing basic t=
hings
>> >> >> > transport does or all things it can do?
>> >> >> >
>> >> >> > If the later, this ignores several things that transports can do=
,
>> >> >> > such as shared memory, data in notification, etc.
>> >> >>=20
>> >> >> Maybe split this up?
>> >> >>=20
>> >> >> A transport needs to implement the following:
>> >> >> <list of mandatory things>
>> >> >>=20
>> >> >> A transport is encouraged to implement the following:
>> >> >> <list of non-mandatory, but strongly suggested things>
>> >> >
>> >> > Some things just depend on feature bits, and a transport
>> >> > can make a feature bit mandatory if it wants to.
>> >>=20
>> >> I wasn't thinking about mandatory for a device/driver, but mandatory =
for
>> >> a transport (e.g. stuff like per-queue reset which is not mandatory f=
or
>> >> a transport to implement.)
>> >
>> > Same thing really.
>> > For example, queue reset is controlled by VIRTIO_F_RING_RESET
>>=20
>> Well, it is -- but a transport can choose not to implement the feature
>> bit. I guess what I'd like to do is to set expectations: every transport
>> needs e.g. some way to do notifications, but it can skip some other
>> things like "device discovery", for example. I think the appendix is
>> intended as a reference for someone wanting to design a transport, and
>> some kind of laundry list would help there.
>
> Yes. I am however a little worried that if we include optional features
> we have just increased the cost of adding any new transport feature -
> it now has to be added in this appendix, too.
>
> So maybe stick to just the basics? WDYT?

I'd be happy with the basics only -- the features are documented anyway,
and the important part is being able to figure out what is not optional.

