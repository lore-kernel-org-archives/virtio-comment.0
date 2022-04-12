Return-Path: <helei.sig11@bytedance.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [External] [virtio-comment] [V3 PATCH 0/1] Introduce virtio
 asymmetric crypto service
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <CABgObfZEW9BPaj3XRca0JxZdY7JvGKaBWcq0PVda3O4J+qccQQ@mail.gmail.com>
Date: Tue, 12 Apr 2022 18:34:28 +0800
Message-Id: <B92BC36B-0972-4C31-B072-6F3BEB82026F@bytedance.com>
References: <50696.122041204145900103@us-mta-219.us.mimecast.lan>
 <CABgObfZEW9BPaj3XRca0JxZdY7JvGKaBWcq0PVda3O4J+qccQQ@mail.gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>, Cornelia Huck <cohuck@redhat.com>, "S. Tsirkin, Michael" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, zhenwei pi <pizhenwei@bytedance.com>, Xin Zeng <xin.zeng@intel.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>
List-ID: <virtio-comment.lists.oasis-open.org>



> On Apr 12, 2022, at 4:55 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> On Tue, Apr 12, 2022 at 10:15 AM Cornelia Huck <cohuck@redhat.com> wrote:
>> +#define VIRTIO_CRYPTO_RSA_NO_HASH   0
>> +#define VIRTIO_CRYPTO_RSA_MD2       1
>> +#define VIRTIO_CRYPTO_RSA_MD3       2
>> +#define VIRTIO_CRYPTO_RSA_MD4       3
>> +#define VIRTIO_CRYPTO_RSA_MD5       4
>> +#define VIRTIO_CRYPTO_RSA_SHA1      5
>> +#define VIRTIO_CRYPTO_RSA_SHA256    6
>> +#define VIRTIO_CRYPTO_RSA_SHA384    7
>> +#define VIRTIO_CRYPTO_RSA_SHA512    8
>> +#define VIRTIO_CRYPTO_RSA_SHA224    9
>=20
> Hi, should virtio-crypto really support outdated hashes such as MD2-MD5?
> The kernel driver that has been merged only uses SHA1 or raw.
>=20
> Paolo
>=20

Removing these outdated hash algorithms is OK for me,  there are two reason=
s to keep
these outdated hashing algorithms:
1. In the early stage of development, I referred to OpenSSL, and those hash
 algorithms are all supported by OpenSSL.
2. When providing signing/verifying services, we only need to use their cor=
responding
 OIDs instead of doing the actual hashing.
Now that hashing algorithms like md2 are considered outdated by everyone, i=
t is better to
remove them before the protocol is updated.

As Daniel said, we can also use VIRTIO_CRYPTO_HASH_XXX directly to specify =
the=20
hash algorithm for rsa-pkcs1pad. But there is a little problem here: linux =
kernel=E2=80=99s=20
built-in rsa-pkcs1pad implementation can recognize rmd160.=20
Should we add a constant like =E2=80=98VIRTIO_CRYPTO_HASH_RMD160=E2=80=99 ?=
=09

