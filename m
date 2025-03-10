Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5AE22A1CB
	for <virtio-comment@lists.linux.dev>; Mon, 10 Mar 2025 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741613032; cv=none; b=RfIp+49GFnFkbFD2XmmWsKOViP+xER1m7tpF8qy7MHx5WA+tpbt1MGYhTZTQWfYpxrAhHthK76LbLTCDVqNv2jy/azDdptnOsGhv35g9YcHMAGomRlVN02PVMKXiEyp7FrP6OQPqhAUtCE50WQpoYRClKQhGS/zm4ovgX5AFmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741613032; c=relaxed/simple;
	bh=Rml4S+yX49ofheAKe/mG08RyfIVISfHHtrnUm1EggYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sQMuFoZDl8lof7UBcZ0dKQxBMKZo4wc+e8FHi9Ps/CMAvv1K6xi655tiK2oyrSmjQwwdbI2fWORhlhughNLXAeAOuwUCKjbRzQyTz+0hgsdBg/oSw7Rq9/BsqXkGL92Zkul4Ig58tAIJ+BljtrE+5HDoxeWzCY93PGU2uc/6C3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RyUnHWTd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RyUnHWTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741613029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RzkG9I3C/3rVqvOXj+fBY/Q0NCOR1OF3HPKnpZgkl24=;
	b=RyUnHWTdVcH/hqz3oChlI9sW4zS49nehBsdqQ9aGk0+mpu272sgGJ56ZYL7o8Jn4QL6dEm
	EhCy4klQfnYP2FB4JaTsRsIkPkpLWjeHWaZPw4l2ld1Inm4jF8zX05t62PKtfJoxQDBumR
	FKcL1Gk1dUu/f3kqzaJs8buzZojMATI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-150-8V9ZCx7-PLe43FRgpjNuMg-1; Mon,
 10 Mar 2025 09:23:45 -0400
X-MC-Unique: 8V9ZCx7-PLe43FRgpjNuMg-1
X-Mimecast-MFC-AGG-ID: 8V9ZCx7-PLe43FRgpjNuMg_1741613025
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C814119560B3;
	Mon, 10 Mar 2025 13:23:44 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99909180094A;
	Mon, 10 Mar 2025 13:23:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, Parav Pandit
 <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "mst@redhat.com" <mst@redhat.com>
Subject: Re: [PATCH v2] README.md: add example email for TC vote request
In-Reply-To: <Z8bnpjiYpmiFH7+7@fedora>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250227150241.1274768-1-mvaralar@redhat.com>
 <CY8PR12MB71951BEE03E73E7CF1715A91DCCF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <Z8bnpjiYpmiFH7+7@fedora>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 10 Mar 2025 14:23:36 +0100
Message-ID: <87h641uihz.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bmeTspFPJXfntJziby2_UsHvLLLHLWT818eejck91JY_1741613025
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Tue, Mar 04 2025, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrote:

> On Sat, Mar 01, 2025 at 06:08:32AM +0000, Parav Pandit wrote:
>> 
>> 
>> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> > Sent: Thursday, February 27, 2025 8:33 PM
>> > 
>> > Acked-by: Cornelia Huck <cohuck@redhat.com>
>> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> > ---
>> > v1 -> v2: add Subject and To
>> > ---
>> >  README.md | 11 ++++++++++-
>> >  1 file changed, 10 insertions(+), 1 deletion(-)
>> > 
>> > diff --git a/README.md b/README.md
>> > index c06caf6..731838b 100644
>> > --- a/README.md
>> > +++ b/README.md
>> > @@ -206,7 +206,16 @@ The mail requesting the vote should include the
>> > following, on a line by itself:<  <code>
>> >  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>> >  </code>
>> > -(NNN is the issue number)</li>
>> > +(NNN is the issue number)<br>
>> > +For example, you can use the following template when requesting the TC
>> > +vote:<br> <code>
>> > +Subject: PATCH [description of changes]<br>
>> > +To: virtio-comment@lists.linux.dev<br>
>> > +
>> > +Could please open a voting ballot for these changes?
>> > +
>> > +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>> > +</code></li>
>> >  <li>Please make sure to allow time for review between posting a comment
>> > and asking for a vote. </li>  </ol>
>> > 
>> > base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
>> > --
>> > 2.42.0
>> Reviewed-by: Parav Pandit <parav@nvidia.com>
>> 
>
> Could please open a voting ballot for these changes?
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/219 
>
> Thanks, Matias.

We can do this via a ballot; I'd also be fine doing this as an editorial
update.

