Return-Path: <mst@redhat.com>
Date: Mon, 1 Aug 2022 16:56:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 0/5] Introduce virtio transport virtqueue
Message-ID: <20220801165438-mutt-send-email-mst@kernel.org>
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220801093216.362119-1-lingshan.zhu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 01, 2022 at 05:32:11PM +0800, Zhu Lingshan wrote:
> This series introduces virtio transport virtqueue as a new
> transport layer for virtio devices.
> 
> This series defines the concepts of virtio management device
> and virtio managed devices.


Overall I'm happy with the progress made here. Pls keep iterating.
I would like to see whether we can unify this with the admin
queue work somehow. The technology is different (SIOV vs SRIOV)
but there are also similarities.

Do you care to review some patches from the admin queue proposals maybe?


> This series also defines a commands set over the transport virtqueue,
> including:
> The command to query available resources of the management device
> The commands to create / destroy the managed devices.
> The commands to config the managed devices.
> The commands to config virtqueues of the managed devices.
> 
> Changes form V1:
> 1)Add a command to set per-vq asid(Jason)
> 2)Add a command to reset a virtqueue(Jason)
> 3)Add support for packed virtqueue state(Jason)
> 4)Allow nested managed devices(Jason)
> 5)Provides device feature bits in the provisioning(Jason)
> 6)Removed most of the error codes, only left OK and ERR(Jason)
> 7)“virtual devices” is renamed to “managed devices”, to be more general(Jason)
> 
> Zhu Lingshan (5):
>   Introduce virito transport virtqueue
>   Introduce feature bit VIRTIO_F_TRANSPT_VQ_MDEV
>   Introduce the commands set of the transport vq
>   Describe the process to present a managed device
>   Add transport vq number for virtio blk and net
> 
>  content.tex      | 784 +++++++++++++++++++++++++++++++++++++++++++++++
>  introduction.tex |   3 +
>  2 files changed, 787 insertions(+)
> 
> -- 
> 2.35.3

