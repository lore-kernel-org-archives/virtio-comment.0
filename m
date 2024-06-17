Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929BD27D
	for <virtio-comment@lists.linux.dev>; Mon, 17 Jun 2024 02:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718593092; cv=none; b=lqqHC0i53R0LY9XZAnJ0n+DDomkxtI6BHSoXN2F7fpm1LU7MN010XUSIVsnmcY2Lvojviupqdp6hnxOmypfGWUn3z9rJ8IfQ2+M6bJQwunXGZmtR3EEp4eqvZOME1bMidFCL0SPyHND+99XR0plV96NBTGuuSJCa9WCGVW/9SUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718593092; c=relaxed/simple;
	bh=Z9k21GMLPBjvc4Ghm6JaZhjTp8EwIGTPDe3R509hrGg=;
	h=Message-ID:Subject:Date:From:To:Cc:References:In-Reply-To; b=U6fU6ekMk5lwWxwOs8CAmLdasVToaqSUlUhQiaMc+cXRew2VNOvfZ/JzJyBhc5VJGlFMOJeXrbdYsWdW7IeuB9emyYEmaBoy7xdd6ud9HgQ48zBfm/eZgh7RXgAl6uj2Z96o+ZcQDZuZS4RPCPZEqa7+5F4/t2TXgQ4UpAXOul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cRrgPcMP; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cRrgPcMP"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718593080; h=Message-ID:Subject:Date:From:To;
	bh=WGXiM2JxqCUD8td7JLkwehXiKtY/Z7NviX/ww01Jvc8=;
	b=cRrgPcMP5czXAFhB2n5zl6vMUX2YqOiQZjgGXdLzRBXCyFCXmTtyuojSZVv81f/d+Cv+DSL+7iuAgvp+UXPtZy9faAWcVCwMX+yIYcfg03q9cwbosquxtYrWradid18x2JRBGdCMk1LKc531r0VWn/oWDQ2CsFTv4VMedjHoXPo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R651e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0W8X5.IN_1718592761;
Received: from localhost(mailfrom:hengqi@linux.alibaba.com fp:SMTPD_---0W8X5.IN_1718592761)
          by smtp.aliyun-inc.com;
          Mon, 17 Jun 2024 10:52:41 +0800
Message-ID: <1718592520.4509614-7-hengqi@linux.alibaba.com>
Subject: Re: re Issue #194: virtio-net: clarify coalescing parameters settings
Date: Mon, 17 Jun 2024 10:48:40 +0800
From: Heng Qi <hengqi@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Halil Pasic <pasic@linux.ibm.com>, Si-Wei Liu <si-wei.liu@oracle.com>
References: <20240613050316-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240613050316-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

On Thu, 13 Jun 2024 07:26:15 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> Hello!
> The ballot on issue #194 is set to conclude however some comments by TC
> members made me think some members were confused about the voting
> process. In particular two members abstained leaving
> a comment which makes me think they were actually against merging
> the proposal.


Have the comments from Pasic, Halil and Liu, Si-Wei been addressed?
I don't see an updated response. If you have more comments, please reply :)

> 
> I would like to clarify two things:
> 
> - 1.4 release (for which this is targeted) is not imminent.
>   there's no reason to merge a controversial patch, we can
>   work until there is a rough consensus.
> 
> - even with a non released spec we do try to maintain compatibility
>   so it's a level of commitment to accept a patch.
> 
> 
> Further the ballot was part of a big batch of 5 ballots
> at the same time, and the description in the commit log
> and the text itself do not 100% align.
> 
> 
> Given all this, I am inclined to let the discussion go on
> a bit longer, and re-do the vote with a new version
> of the proposal.
> 
> 
> Objections?
> 
> -- 
> MST
> 
