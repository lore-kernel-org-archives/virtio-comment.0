Return-Path: virtio-comment-return-692-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50F00985E94
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Mar 2019 16:36:24 +0000 (UTC)
Date: Wed, 6 Mar 2019 16:36:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190306163616.GA29057@stefanha-x1.localdomain>
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
Subject: Re: [virtio-comment] RFC: virtio-hostmem (+ Continuation of
 discussion from [virtio-dev] Memory sharing device)
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Roman Kiryanov <rkir@google.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> \section{Host Memory Device}\label{sec:Device Types / Host Memory Device}

The Host Memory Device defines an entirely new device model that bypasses
VIRTIO.  Why make this a VIRTIO device if the VIRTIO device model is not a good
fit for what you're trying to achieve?  This device seems out of scope to me.

>
> Note: This depends on the upcoming shared-mem type of virtio
> that allows sharing of host memory to the guest.
>
> virtio-hostmem is a device for sharing host memory all the way to the guest userspace.
> It runs on top of virtio-pci for virtqueue messages and
> uses the PCI address space for direct access like virtio-fs does.

Perhaps a more general way to express this is to explain that it provides
direct access to memory using Shared Memory Resources.  (The ones defined by
David Gilbert's work-in-progress spec.)  Then you could remove explicit
references to virtio-pci, PCI, and virtio-fs.

>
> virtio-hostmem's purpose is
> to allow high performance general memory accesses between guest and host,
> and to allow the guest to access host memory constructed at runtime,
> such as mapped memory from graphics APIs.
>
> Note that vhost-pci/vhost-vsock, virtio-vsock, and virtio-fs

vhost-pci and virtio-vhost-user (is that what you meant?) are unlikely to be in
the VIRTIO specification any time soon, so readers might not be aware of them.

> are also general ways to share data between the guest and host,
> but they are specialized to socket APIs in the guest plus
> having host OS-dependent socket communication mechanism,
> or depend on a FUSE implementation.
>
> virtio-hostmem provides guest/host communication mechanisms over raw host memory,
> as opposed to sockets,
> which has benefits of being more portable across hypervisors and guest OSes,
> and potentially higher performance due to always being physically contiguous to the guest.

/to the guest/in guest memory/?

> \subsection{Fixed Host Memory Regions}\label{sec:Device Types / Host Memory Device / Communication over Fixed Host Memory Regions}
>
> Shmids will be set up as a set of fixed ranges on boot,

What does this mean?  Where is the meaning of each shmid defined and how is it
represented?

> one for each sub-device available.

Please explain sub-devices first.

> This means that the boot-up sequence plus the guest kernel

boot-up sequence -> the guest boot-up sequence?

> configures memory regions used by sub-devices once on startup,
> and does not touch them again;

Normally the VIRTIO specification talks about a "device" and a "driver" rather
than the guest, guest kernel, guest userspace, etc.  It focuses on the
device/driver interface rather than on other layers of the stack.

After reading this paragraph it's still not clear how sub-devices are detected,
configured, numbered, etc and who is really responsible for that.

> this simplifies the set of possible behavior,
> and bounds the maximum amount of guest physical memory that can be used.
>
> It is always assumed that the memory regions act as RAM
> and are backed in some way by the host.
> There is no caching, all access is coherent.

What does no caching mean?  The memory pages should be mapped like normal RAM,
right?

> When the guest sends notifications to the host,
> Memory fence instructions are automatically deployed
> for architectures without store/load coherency.
>
> The host is allowed to lazily back / modify which host pointers
> correspond to the physical address ranges of such regions,
> such as in response to sub-device specific protocols,
> but is never allowed to leave those mappings unmapped.

The part of lazily backing address ranges is a device implementation detail
that is not visible in the device-driver interface.  I suggest removing these
kinds of statements on focussing on the device-driver interface instead.

Regarding leaving mappings unmapped, a device normative section can specify
that "every page in the address range MUST be accessible so that the driver
does not encounter an CPU architecture-specific error when accessing a page".

> These guest physical memory regions persist throughout the lifetime of the VMM;

Memory region == sub-device == shmid?

> they are not created or destroyed dynamically even if the virtio-hostmem device
> is realized as a PCI device that can hotplug.

I'm not sure what the hotplug statement means.  If the device is not plugged in
yet, then the memory regions are absent from the guest memory space, right?
Once the device is plugged in they become present?  Once the device is removed
they are gone again?  If another device is hotplugged later it could have
different sub-devices/memory regions?

>
> The guest physical regions must not overlap and must not be shared
> directly across different sub-device types.

Please move this into a device normative section and s/must/MUST/.

What does "shared directly" mean?

>
> \subsection{Sub-devices and Instances}\label{sec:Device Types / Host Memory Device / Sub-devices and Instances}
>
> The guest and host communicate
> over the config, notification (tx) and event (rx) virtqueues.
> The config virtqueue is used for instance creation/destruction.
>
> The guest can create "instances" which capture
> a particular use case of the device.
> Different use cases are distinguished by different sub-device IDs;
> virtio-hostmem is like virtio-input in that the guest can query
> for sub-devices that are implemented on the host via device and vendor ID's;
> the guest provides vendor and device id in a configuration message.
> The host then accepts or rejects the instance creation request.
>
> Each instance can only touch memory regions
> associated with its particular sub-device,
> and only knows the offset into the associated memory region.
> It is up to the userspace driver / device implementation to
> resolve how offsets into the memory region are shared across instances or not.

An earlier statement says regions "must not be shared directly across different
sub-device types".  So they can be shared across instances but not sub-device
types?

>
> This means that it is possible to share the same physical pages across multiple processes,
> which is useful for implementing functionality such as gralloc/ashmem/dmabuf;
> virtio-hostmem only guarantees the security boundaries where
> no sub-device instance is allowed to access the memory of an instance of
> a different sub-device.
>
> Indeed, it is possible for a malicious guest process to improperly access
> the shared memory of a gralloc/ashmem/dmabuf implementation on virtio-hostmem,
> but we regard that as a flaw in the security model of the guest,
> not the security model of virtio-hostmem.
>
> When a virtio-hostmem instance in the guest is created,
> a use-case-specific initialization happens on the host
> in response to the creation request.
>
> In operating the device, a notification virtqueue is used for the guest to notify the host
> when something interesting has happened in the shared memory via communicating
> the offset / size of any transaction, if applicable, and metadata.
> This makes it well suited for many kinds of high performance / low latency
> devices such as graphics API forwarding, audio/video codecs, sensors, etc;
> no actual memory is sent over the virtqueue.
>
> Note that this is asymmetric;
> there will be on tx notification virtqueue for each guest instance,
> while there is only one rx event virtqueue for host to guest notifications.
> This is because it can be faster not to share the same virtqueue
> if multiple guest instances all use high bandwidth/low memory operations
> over the virtio-hostmem device to send data to the host;
> this is especially common for the case of graphics API forwarding
> and media codecs.
>
> Both guest kernel and userspace drivers can be written using operations
> on virtio-hostmem in a way that mirrors UIO for Linux;
> open()/close()/ioctl()/read()/write()/mmap(),
> but concrete implementations are outside the scope of this spec.
>
> \subsection{Example Use Case}\label{sec:Device Types / Host Memory Device / Example Use Case}
>
> Suppose the guest wants to decode a compressed video buffer.
>
> \begin{enumerate}
>
> \item VMM is configured for codec support and a vendor/device/revision id is associated
>     with the codec device.
>
> \item On startup, a physical address range, say 128 MB, is associated with the codec device.
>     The range must be usable as RAM, so the host backs it as part of the guest startup process.
>
> \item To save memory, the codec device implementation on the host
>     can begin servicing this range via mapping them all to the same host page. But this is not required;
>         the host can initialize a codec library buffer on the host on bootup and pre-allocate the entire region there.
>         The main invariant is that the physical address range is never not mapped as RAM and usable as RAM.
>
> \item Guest creates an instance for the codec vendor id / device id / revision
>     via sending a message over the config virtqueue.
>
> \item Guest codec driver does an implementation dependent suballocation operation and communicates via
>     notification virtqueue to the host that this instance wants to use that sub-region.
>
> \item The host now does an implementation dependent operation to back the sub-region with usable memory.
>     But this is not required; the host could have set the entire region up at startup.
>
> \item Guest downloads compressed video buffers into that region.
>
> \item Guest: After a packet of compressed video stream is downloaded to the
>     buffer, another message, like a doorbell, is sent on the notification virtqueue to
>         consume existing compressed data. The notification message's offset field is
>         set to the proper offset into the shared-mem object.
>
> \item Host: Codec implementation decodes the video and puts the decoded frames
>     to either a host-side display library (thus with no further guest
>         communication necessary), or puts the raw decompressed frame to a
>         further offset in the shared memory region that the guest knows about.
>
> \item Guest: Continue downloading video streams and sending notifications,
>     or optionally, wait until the host is done first. If scheduling is not that
>         big of an impact, this can be done without even any further VM exit, by
>         the host writing to an agreed memory location when decoding is done,
>         then the guest uses a polling sleep(N) where N is the correctly tuned
>         timeout such that only a few poll spins are necessary.
>
> \item Guest: Or, the host can send back on the event virtqueue \field{revents}
>     and the guest can perform a blocking read() for it.
>
> \end{enumerate}
>
> The unique / interesting aspects of virtio-hostmem are demonstrated:
>
> \begin{enumerate}
>
> \item During instance creation the host was allowed to reject the request if
>     the codec device did not exist on host.
>
> \item The host can expose a codec library buffer directly to the guest,
>     allowing the guest to write into it with zero copy and the host to decompress again without copying.
>
> \item Large bidirectional transfers are possible with zero copy.
>
> \item Large bidirectional transfers are possible without scatterlists, because
>     the memory is always physically contiguous.
>
> \item It is not necessary to use socket datagrams or data streams to
>     communicate the notification messages; they can be raw structs fresh off the
>         virtqueue.
>
> \item After decoding, the guest has the option but not the requirement to wait
>     for the host round trip, allowing for async operation of the codec.
>
> \item The guest has the option but not the requirement to wait for the host
>     round trip, allowing for async operation of the codec.
>
> \end{enumerate}

I skipped everything until here because I really need to see the driver/device
interface before further statements will make any sense.  Perhaps the spec can
be reordered, it's hard to read it linearly.

>
> \subsection{Device ID}\label{sec:Device Types / Host Memory Device / Device ID}
>
> 21
>
> \subsection{Virtqueues}\label{sec:Device Types / Host Memory Device / Virtqueues}
>
> \begin{description}
> \item[0] config
> \item[1] event
> \item[2..n] notification
> \end{description}

The text previously talked about rx/tx queues.  I don't see them here?  Please
pick one term and use it consistently.

>
> There is one notification virtqueue for each instance.
> The maximum number of virtqueue is kept to an implementation-specific limit

s/virtqueue/virtqueues/

> that is stored in the configuration layout.
>
> \subsection{Feature bits}\label{sec: Device Types / Host Memory Device / Feature bits }
>
> No feature bits.
>
> \subsubsection{Feature bit requirements}\label{sec:Device Types / Host Memory Device / Feature bit requirements}
>
> No feature bit requirements.
>
> \subsection{Device configuration layout}\label{sec:Device Types / Host Memory Device / Device configuration layout}
>
> The configuration layout enumerates all sub-devices and a guest physical memory region
> for each sub-device.
>
> \begin{lstlisting}
> struct virtio_hostmem_device_memory_region {
>     le64 phys_addr_start;
>     le64 phys_addr_end;
> }
>
> struct virtio_hostmem_device_info {
>     le32 vendor_id;
>     le32 device_id;
>     le32 revision;
>     struct virtio_hostmem_device_memory_region mem_region;
> }
>
> struct virtio_hostmem_config {
>     le32 num_devices;
>     virtio_hostmem_device_info available_devices[MAX_DEVICES];
>     le32 MAX_INSTANCES;
> };

Where is MAX_DEVICES defined?

>
> One shared memory shmid is associatd with each sub-device.

I'm confused.  The code only mentions "device" but the spec mentions
sub-device.  Are they different concepts?

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcf/cAAAoJEJykq7OBq3PIWKgH/ilbkhdLDTUUf21Uu6A0Xo0s
x50ZyJu4P7La8vx8pSBGf5QIWzK6Jib/DifMYSpiwQQx0Res3TB4bE5T3a440bWp
6xnO8CGyO0n4KCFH4irXCSSg/pOI7GI+XWQhr0lAT93aia3nQ3diYL33685MbFh7
KkkRP0H+4h/P7B6+Ox/RrznEWSKuWQzX2g6FpnWG+CVQsklYoOBhpGJtUGQt0JZT
uKxByzZPyw5vcdUln3wzyac2KFzL4O8vRV22z9w3ayNHCaSkR+0N7ACBzc94/BIQ
UBWDFplibXN53L3WxeWhe0xEdUiYIcUTGXdhTpWnhK5U9eo5Ru6RgQui40GqvMo=
=V1kc
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
