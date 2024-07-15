Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59353185600
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 08:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033538; cv=none; b=fDXVWya1VHE2g0Fqg5Wqo4qlMJttW0AdIlzbJDktTwcjA6m/ipl1CbH1vSRLjdahYN/U4AJflwlvJphjUM8PVIZzM1g22Iq2LI5db8xobxsWXISfz1HzJv4HTPGeOPF5rAhRiSfGzAPWcPrppRlrvRXlKoH776mceTZqtUA/Q0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033538; c=relaxed/simple;
	bh=W3nkVBmzFN0hpelTBHSgCcZO8adBqrXoGDLQVyS2cf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u45f9bTR+EXGPgYZE80nZOMR+xza63paeTMktVI3qs1PSqGskrWVeDQFcHh/UX15fzNZb2V9PLaMY5XgL/y9kidmYJusDpGRPXJO3vUZ//iJiMlhDIWWgFHUAsVkGwJWs7N7MXgThkkuH9hj8j82pWPmP8CGOMXf+/q0P7xvSGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E7zJsiQZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E7zJsiQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721033535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUif7tc4qcWnx0AA8Rt4MIjtmiXPKC00eTVJt/9hhuY=;
	b=E7zJsiQZU/O05+UNVBBHs6GEah7PX7ku1qgpBUWUnSiYuxdC3K44qqIIJX05c1YE5hWtNi
	wOqvJmjO5aLPt3rlRV6RFi476IoJG7kvZXLsHtdUdCBDvn3k763gS/5FtfL/9tl9AG/Utv
	jP7i/lxpnfDYclUr7vYNJZAc+sUxvjo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-AfblfAt7PgyQ0WVIoVh6jw-1; Mon,
 15 Jul 2024 04:52:13 -0400
X-MC-Unique: AfblfAt7PgyQ0WVIoVh6jw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44C471955D55;
	Mon, 15 Jul 2024 08:52:12 +0000 (UTC)
Received: from localhost (dhcp-192-176.str.redhat.com [10.33.192.176])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EE3A1955F40;
	Mon, 15 Jul 2024 08:52:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: RE: [PULL v4 ] administration commands for device parts
In-Reply-To: <PH0PR12MB5481DCC7A15A54F6595AF7F0DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
 <20240714115023-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481DCC7A15A54F6595AF7F0DCA02@PH0PR12MB5481.namprd12.prod.outlook.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 15 Jul 2024 10:52:08 +0200
Message-ID: <877cdnavgn.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On Sun, Jul 14 2024, Parav Pandit <parav@nvidia.com> wrote:

> However, with commit [1], hitting below error for makediffpdf.sh and makediffhtml.sh too.
> 	
> HEAD is now at b495841 transport-mmio: fix up makediff from 1.2
> Applying editorial: allow for longer device id table: makediff 1.3
> [detached HEAD d213eb3] editorial: allow for longer device id table: makediff 1.3
>  Author: Cornelia Huck <cohuck@redhat.com>
>  Date: Mon Oct 30 14:42:05 2023 +0100
>  1 file changed, 2 insertions(+), 2 deletions(-)
> Applying admin: Prepare table for multipage listing
> Auto-merging makediff.sh
> CONFLICT (content): Merge conflict in makediff.sh
> error: could not apply c69ccb2... makediff: cherry pick table env change
> hint: After resolving the conflicts, mark them with
> hint: "git add/rm <pathspec>", then run
> hint: "git cherry-pick --continue".
> hint: You can instead skip this commit with "git cherry-pick --skip".
> hint: To abort and get back to the state before "git cherry-pick",
> hint: run "git cherry-pick --abort".
>
> [1] https://github.com/oasis-tcs/virtio-spec/commit/c69ccb2f16e09e5dab9b9399b72b701d51f26b6a
> [2] https://lore.kernel.org/virtio-comment/20240714221837.3323459-1-parav@vr-arch-host06.mtvr.labs.mlnx/T/#u

Changed line numbers probably throw it off... maybe using a different
merge strategy for the cherry pick would make it succeed?

