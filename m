Return-Path: <virtio-comment-return-3924-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7143A986210
	for <virtio-comment@lists.oasis-open.org>; Sun, 29 Jan 2023 03:33:32 +0000 (UTC)
Date: Sun, 29 Jan 2023 11:32:43 +0800
From: =?UTF-8?B?5L6v6Iux5LmQ?= <houyingle@sudoinfotech.com>
References: <961D315C9D3A523B+202301111121345064138@sudoinfotech.com>, 
	<Y77S5+YK31f6QKaN@fedora>, 
	<E0D19197FBCBB3B9+2023011710040633577713@sudoinfotech.com>, 
	<Y8bGYRN69UOv2o29@fedora>, 
	<20230119064213-mutt-send-email-mst@kernel.org>
Mime-Version: 1.0
Message-ID: <7E9D0395E3E96E2E+2023012911324146420712@sudoinfotech.com>
Subject: Re: Re: [virtio-comment] About adding a new device type virtio-nvme
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64
To: "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment <virtio-comment@lists.oasis-open.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>, sgarzare <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

VGh1LCAxOSBKYW4gMjAyMyAwNjo0Mjo0OSAtMDUwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
OgoKPk9uIFR1ZSwgSmFuIDE3LCAyMDIzIGF0IDExOjAxOjM3QU0gLTA1MDAsIFN0ZWZhbiBIYWpu
b2N6aSB3cm90ZToKCj4+ID4gVGhlIE5WTUUgdGVjaG5vbG9neSBhbmQgZWNvc3lzdGVtIGFyZSBj
b21wbGV0ZS4gSG93ZXZlciwgaW4gdmlydHVhbGl6YXRpb24gc2NlbmFyaW9zLCBOVk1FIGRldmlj
ZXMgY2FuIG9ubHkgdXNlIFBDSWUgcGFzcy10aHJvdWdoIC4gV2hlbiBOVk1FIGFuZCB2aXJ0aW8g
Y29tYmluZSB0byBjb25uZWN0IHRvIHRoZSB2RFBBIGVjb3N5c3RlbSwgbGl2ZSBtaWdyYXRpb24g
aXMgc3VwcG9ydGVkLgoKPj4gPgoKPj4gPgoKPj4gPiA+TGV0J3Mgbm90IGZvcmdldCB0aGF0IHZp
cnRpby1ibGsgaXMgd2lkZWx5IHVzZWQgYW5kIG5ldyBjb21tYW5kcyBhcmUKCj4+ID4gPmJlaW5n
IGFkZGVkIGFzIG5lZWRlZC4gV2hpY2ggTlZNZSBmZWF0dXJlcyBhcmUgeW91IG1pc3NpbmcgaW4K
Cj4+ID4gPnZpcnRpby1ibGs/Cgo+PiA+Cgo+PiA+IFdpdGggdGhlIGludHJvZHVjdGlvbiBvZiB0
aGUgY29uY2VwdCBvZiBEUFUsIGEgbGFyZ2UgbnVtYmVyIG9mIHZlbmRvcnMgYXJlIG9mZmxvYWRp
bmcgdmlydHVhbCBkZXZpY2VzIHRvIGhhcmR3YXJlLiBUaGUgYmFjay1lbmQgb2YgVmlydGlvLWJs
ayBkb2VzIG5vdCBzdXBwb3J0IHJlbW90ZSBzdG9yYWdlLiBUaGVyZWZvcmUsIFZpcnRpby1Odm1l
LW9mIGNhbiB3ZWxsIGNvbWJpbmUgdGhlIGFkdmFudGFnZXMgb2YgcmVtb3RlIHN0b3JhZ2UgYW5k
IHZpcnRpbyBsaXZlIG1pZ3JhdGlvbgoKPj4KCj4+IHZpcnRpby1ibGsgaXMganVzdCBhIHN0b3Jh
Z2UgaW50ZXJmYWNlLCB3aGV0aGVyIHRoYXQgc3RvcmFnZSBpcyBsb2NhbCBvcgoKPj4gcmVtb3Rl
IGlzIHVwIHRvIHRoZSBkZXZpY2UgaW1wbGVtZW50YXRpb24uIFRoZSBibG9jayBkZXZpY2UgY291
bGQgYmUKCj4+IGxvY2F0ZWQgb24gQ2VwaCwgTkZTLCBldGMuCgo+PgoKPj4gRWFjaCB2aXJ0aW8t
YmxrIGRldmljZSBpcyBhIHNpbmdsZSBibG9jayBkZXZpY2UuIFRoZXJlIGlzIG5vCgo+PiBzdGFu
ZGFyZGl6ZWQgbWFuYWdlbWVudCBwcm90b2NvbCBpbiB2aXJ0aW8tYmxrIGZvciBjb25uZWN0aW5n
IHRvIHJlbW90ZQoKPj4gYmxvY2sgZGV2aWNlcy4gSSdtIGF3YXJlIG9mIGhhcmR3YXJlIHZpcnRp
by1ibGsgZGV2aWNlcyB0aGF0IGNvbm5lY3QgdG8KCj4+IHJlbW90ZSBzdG9yYWdlLiBDb25maWd1
cmF0aW9uIGlzIHBlcmZvcm1lZCB0aHJvdWdoIGFuIG91dC1vZi1iYW5kCgo+PiBtYW5hZ2VtZW50
IGludGVyZmFjZS4KCj4+Cgo+PiBNYXliZSB3aGVuIHlvdSBzYXkgdmlydGlvLWJsayBkb2Vzbid0
IHN1cHBvcnQgcmVtb3RlIHN0b3JhZ2UgdGhpcyBpcwoKPj4gd2hhdCB5b3UgbWVhbj8KCj4+Cgo+
PiBTdGVmYW4KCj4KPuS+r+iLseS5kCB5b3UgbmV2ZXIgYW5zd2VyZWQgdGhpcyBxdWVzdGlvbi4K
CgpBbGwgdGhlIHRvcGljcyByZXZvbHZlIGFyb3VuZCB0aGUgc2NlbmFyaW8gd2hlcmUgdGhlIHZp
cnRpbyBkZXZpY2UgaXMgb2ZmbG9hZGluZyBpbnRvIHRoZSBEUFUuClZpcnRpbyBoYXMgYSBmcm9u
dC1lbmQgYW5kIGEgYmFjay1lbmQuIFdoYXQgSSBtZWFuIGlzIHRoYXQgSSB3YW50IHRvIGltcGxl
bWVudCB0aGUgYmFjay1lbmQgb2YgVmlydGlvLWJsayBvbiB0aGUgRFBVLgoKwqAKCgoKCgoKCsKg
CgoK

