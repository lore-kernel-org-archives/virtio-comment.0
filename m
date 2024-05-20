Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDDC13667E
	for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 13:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716212617; cv=none; b=JM+G1hPbzBGZ4ORp5R9u6j35nXJo9oWf/w2UcqLP5tRYO1rIpZW6KBClKxSv52JCE7KFlDZHr7iSD4CWGjicIM+5SGxbIdhxrFNYHXy73dBBbCoNhM7s1t41nGlFIC/IGCijcMFIvjCw3IUDpoTQ8ukNGNoTo+fNLkgtxN/wDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716212617; c=relaxed/simple;
	bh=DsX5OV0NCZT28DXb8+7IXXhrajaGvNxOzn6Zexf+ts8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F9GPyTmDhfYqqvaIztHOycmsSlezO6NaJXx2CtxHYkpF7PhCOHtCvaF3BEH3g/87oQM5O2qmqs/c3XKGZ8TxFTRmqWHspZvo4wHCe6QEFnyqD8L+QU+4KjHxC9JuTQDkLmXa0Yglt1nHaTx77PhWIkfapoebHVbEfUVUF3xz3gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cu6oJZJV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cu6oJZJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716212614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nI0TmcAMpKhBSsnsonrWXF6IcKiGdkTphzhkADX9i/I=;
	b=cu6oJZJVPS5LgirEqc4obrvGamPHz5fxktAIdbLqO2Hj0rrjdQTP+5Bo3dg37YYejwNs0B
	LYXT7W4xp2038eZWDdu4oUBiQ8cYSRDNQietOtAX06uDW9OV/wbOFX4Xu2jRRnfzv2LuKu
	58MbNCxQdMcngYIC0+dUtb1DuChaRpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401--0vQJZtIOvuKYO8CUjxwlQ-1; Mon, 20 May 2024 09:43:33 -0400
X-MC-Unique: -0vQJZtIOvuKYO8CUjxwlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14D6A80028D
	for <virtio-comment@lists.linux.dev>; Mon, 20 May 2024 13:43:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.224.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22ED340C6EB7;
	Mon, 20 May 2024 13:43:31 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v2] README.md: remove duplicated word
Date: Mon, 20 May 2024 15:43:31 +0200
Message-ID: <20240520134331.4043979-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 1fed245..089db50 100644
--- a/README.md
+++ b/README.md
@@ -11,7 +11,7 @@
 
 <p>This repository documents development processes and hosts the tools used by the OASIS Virtual I/O Device (VIRTIO) Technical Committee.  See also the resources in the <a href="https://github.com/oasis-tcs/virtio-spec">virtio-spec</a> and <a href="https://github.com/oasis-tcs/virtio-docs">virtio-docs</a> TC GitHub repositories</p>
 
-<p>VIRTIO describes describes the specifications of the "virtio" family of devices. These devices are found in virtual environments, yet by design they look like physical devices to the guest within the virtual machine &mdash; and this document treats them as such. This similarity allows the guest to use standard drivers and discovery mechanisms.</p>
+<p>VIRTIO describes the specifications of the "virtio" family of devices. These devices are found in virtual environments, yet by design they look like physical devices to the guest within the virtual machine &mdash; and this document treats them as such. This similarity allows the guest to use standard drivers and discovery mechanisms.</p>
 
 <p>The purpose of VIRTIO and this specification is that virtual environments and guests should have a straightforward, efficient, standard and extensible mechanism for virtual devices, rather than boutique per-environment or per-OS mechanisms.</p>
 
-- 
2.44.0

