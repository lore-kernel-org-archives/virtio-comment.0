Return-Path: <mst@redhat.com>
Date: Mon, 27 Jun 2022 11:20:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH v4] virtio-vsock: add max payload size
 config field
Message-ID: <20220627111907-mutt-send-email-mst@kernel.org>
References: <20220613104038.22010-1-lauralg@amazon.com>
 <20220614135734.534dbc0b.pasic@linux.ibm.com>
 <20220616123431-mutt-send-email-mst@kernel.org>
 <5b08165e-03b9-3583-711e-3380ce964616@amazon.com>
 <20220623121838-mutt-send-email-mst@kernel.org>
 <715340c6-5bda-ca5b-48d4-368ccc0ae846@amazon.com>
 <20220627145907.2f659a75.pasic@linux.ibm.com>
 <20220627090141-mutt-send-email-mst@kernel.org>
 <0ce9b731-ba35-6b0d-a66e-976da2966e54@amazon.com>
MIME-Version: 1.0
In-Reply-To: <0ce9b731-ba35-6b0d-a66e-976da2966e54@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: Laura Loghin <lauralg@amazon.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jun 27, 2022 at 04:33:27PM +0300, Laura Loghin wrote:
> > > > There are sections in the spec that make you think of a buffer as
> > > > corresponding to a descriptor chain, and others that don't, for example:
> > > > 2.6.5    The Virtqueue Descriptor Table: Each descriptor describes a
> > > > buffer which is read-only for the device (“device-readable”) or
> > > > write-only for the device (“device-writable”), but a chain of descriptors
> > > > can contain both device-readable and device-writable buffers.

I think this should just refer to memory:

	Each descriptor describes
	memory which is read-only for the device (``device-readable'') or write-only for the device (``device-writable''), but a chain of
	descriptors can contain both device-readable and device-writable memory.




