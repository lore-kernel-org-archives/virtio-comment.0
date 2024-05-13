Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1867C83CD3
	for <virtio-comment@lists.linux.dev>; Mon, 13 May 2024 21:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715637307; cv=none; b=LpcBDBiIIW9iKeCyI/Od0csVJteLO5fbYDpjbMkt+Cqb9t1aoxOBMMc07cwYiTLu2eoe0ARatX76JstKG2BiJWKswssc0ChcfKUKw8DpU4c8aZkDYBpMOrtjwmaAvtMMpBs1+YIVzoeVAtKB7zxxvPRS4P/tK/JYSV5FvjFXWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715637307; c=relaxed/simple;
	bh=foBqrlMYC9GM5XPpaVB/jDUDFNE/tM8afEEY8b9K/Hk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Of62HWf9XX9fEFdPjRCn33yFDxX+s6ooJJLE+jwwIpBTkgE+PSsjoZqx6VJVkwcRk68bh5gHHyRsq9HwLdCNmxvOXZHr8TNglb3udWjqHIA7Mui9rR6t2Wvn48O6q8Xbyibm2QTCNDPP7fv4gZL4Vq/6XAOVksV02hR0FMiCCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TXu/h9QJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TXu/h9QJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681F2C113CC;
	Mon, 13 May 2024 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715637306;
	bh=foBqrlMYC9GM5XPpaVB/jDUDFNE/tM8afEEY8b9K/Hk=;
	h=Date:From:To:Subject:From;
	b=TXu/h9QJFwGfDQfHxgC9u+c3qpzmk3tsb5HRdOwdUgWiKd4pIN5AGA7be5jtPGiRF
	 yf9euI7LJ93ggsQU0FyFkJtR4BGs15WyuJ6HOEVm/JhFuo+rK98TVl1FwLuCZ/mx2V
	 304b7c6+tjIFKiY6tiy3UmHBXRL4JuRiReFoHWRk=
Date: Mon, 13 May 2024 17:55:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: virtio-comment@lists.linux.dev
Subject: Test archive propagation
Message-ID: <20240513-vehement-jovial-sloth-68c62a@meerkat>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Testing archive propagation after list migration.

-K
