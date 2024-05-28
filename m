Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBCB7316E
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900681; cv=none; b=IUHr7tpuAJVDktmfeGaYAx6qxK1JQOCfJmCdiTeTfBzlUVoIVRCFaQRKknUKp60V1h/Roo3eVeRoRNMqjYDZt+ZnpGiub1vLvxPfD2EUrJ6bK5sU5A8EAZ5Tawan3j3+dwT7eyiV/lxr+Yx+rRTQDi566bXpBgsSCPbW0YdjuZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900681; c=relaxed/simple;
	bh=GfCI4OpcDdvmvBvIPcwnnUQBHfIk+39W7c3NNui7L8M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M8383GvDYUj3OzltP2syY3wHm1O7HhPja5b8XXsxbGILZPF8gejDEFjXDlXbPvqi9o1Y+OHQwL6U8ndW3auSQT6Aa7ih1+bzjLbl4jM5c1Ko31n3zdKJSwFtrnxktn5ebz3dikbd/b/p1Ej7jiySiApAGuAOJX/54NAvGiP6EPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RKtL85lj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RKtL85lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716900678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=VgY9X47MzVY7SPVvVNEGXdqZhYheUKXEJOg5CWyfUBE=;
	b=RKtL85ljXhkCRd5ELDY690EUZGIdyERsfDM53KWE7mqlBDHmlGuEwFiu9EdECG0PfjrWj5
	m9BV4TgtYpsvmGI9hSLz9Uc3ko0Gl0rJN88bblWn58szcThmVKO0wj/pyvZn3ZHXaRrTOl
	IqmzP9HJVnEvd8zZxLlCwBE1vfwzCa8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316--KxWsmCdM8iuI9-H6jKfMw-1; Tue, 28 May 2024 08:51:17 -0400
X-MC-Unique: -KxWsmCdM8iuI9-H6jKfMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D1D185A58C
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 12:51:17 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0666BC15BB1
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 12:51:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: virtio-comment <virtio-comment@lists.linux.dev>
Subject: [RFC] Process to request a vote for an issue
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 28 May 2024 14:51:15 +0200
Message-ID: <87plt6nlq4.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

[first of all: there are still issues with our usage of the platform...]

[Also, first discussing this on virtio-comment, as this is (a) where
people who want to submit changes usually are subscribed, and (b) an
actually working list, unlike the list for the TC...]

The current process to include an update in the spec is something like
the following:
- open a github issue
- post a patch on the list, link it from the issue
  - iterate through some review cycles
- ask for a vote, so that the Chairs will open a ballot

The last step currently mostly happens in the thread for the latest
revision; such an email is easily missed if you're not actively
following the discussion. IMHO it isn't a very reasonable expectation
for the chairs to follow each and every discussion in detail; at some
point, it is much more reasonable to expect trusted reviewers and SMEs
to reach a consensus.

Therefore, I propose that
- request for votes be posted in a new, separate thread, referring to
  the version proposed for inclusion and ideally containing a note on
  who deems this proposal ready for inclusion,
- and those requests be clearly marked in the subject, for example with
  a "[Request for vote]" prefix that can be easily filtered for.

Thoughts, comments?

