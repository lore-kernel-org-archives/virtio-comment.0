Return-Path: virtio-return-3440-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
Date: Fri, 30 Oct 2020 06:15:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20201030061222-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio] allocating device IDs without a vote
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: virtio@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

At the Virtio BoF at the virtual KVM forum, 2020, a recurring theme was
the difficulty contributors face in obtaining device IDs for new
devices. As allocating a new ID is a technicality, and can not break
existing devices, it does not sound too bad to skip a voting step in
that process.

I'd like to hear TC's take on such an idea.

This would be similar to the existing standing rule:

	Minor cleanups, including editorial formatting changes, spelling
	and typo fixes can be committed directly into git for approval as part
	of the next specification approval ballot.

-- 
MST


---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

