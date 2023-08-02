Return-Path: <virtio-comment-return-6968-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81455C001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:51:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CAEE22A81F
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:51:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C54AF9866C1
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:51:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BAFB198660F; Wed,  2 Aug 2023 11:51:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A979C98662A;
	Wed,  2 Aug 2023 11:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ+jz55sRyCQZI6DAlE13f97CuPe/2buu/d67SaPEO40Ff07sD5tUIxOPvWKYQPZWza9m9gQB9e7I7xzE9Ff03S1J2WcEErVILC79D/SiB5wnNTkpNqDVf7ltyaqJfLUY+UkW1HerZSJvqzSJqfhlF3aPNV+Ij+iEBGec022EyyF+gDbXwEIy8ZxEn6pM6txB2aH7xSESOo8/SBL7qCl0E2V1JT3S2L08nBTP1jO4BF1klnAzAII2x9kc/KkL1uK5WzyEiOwOtRoNvHquHzWHsAwjc6KOiM7ya3mfZMxnGvXJDezV68BCUHh1fMAKK3ddOkhHQ95uCO7eRePyABIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1045tM70covDUK2SHzW/Q3VhmdEhdNUumA9O5YIjWEQ=;
 b=AKdWnUf5iEaoO+gsj1EBOVxihZRohyK+VckSqiv7NRaG3UzLEHZpUWCqyYBQvnvJZRFwuSMNCI/efH1zMFZIiNn4zn/g+0LTROqmQzxiHl7rM3Q6dLqEdLG15uWrB3O5oOURxy3wIzfQGI5VEQP2Ah4u0zM/YS7hHFCsMDGJYj0TYv/DbhBii24xOJej1AfumPSjmLkIsGScu4LAdU9CQXZ9OFSu/IX2PAnhctBooIUe8gfjQ1F4o3DbB7q0dJTSFOxGvD7Qcp115c5hwPlyhrJxrp8k4A9P2P6bj//P5UcEukfcrf0CDktImkEJv3ysv8aKTTLn/gyfvkIZx7xogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>
Thread-Topic: proposal: use admin command (and aq) of the device to query
 config space
Thread-Index:
 AdnERrUyzvIBkM4LRwukraLndwiuSgAseh0AAAlA/AAAAFJY4AABoP+AAACZwMAAA2VdgAAAXSsQ
Date: Wed, 2 Aug 2023 11:51:21 +0000
Message-ID:
 <DM8PR12MB548060C7A27EFF9719FD1987DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
 <PH0PR12MB5481E0E5AFEEEAA10FDBEFDADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802073108-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230802073108-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|PH0PR12MB5418:EE_
x-ms-office365-filtering-correlation-id: 48b2536e-2166-473b-e442-08db934eca98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tKiXVDQq11LVWfgUSpcmb1rLkz/Fu3nTBefULEWAinS3GBAJmIVIcsZmSkQRHHLwAOcLFfVZ+0sckpQgq82Dr5DmhNi56yidfrB2XlV89vmPaHHhQ5e3kT7gSBd6Og4AaQ+DrhyUiRhnPpQjWc1oUcZI0lJ0LCRyAyaX4gf6fIhuiKx1RH0QfZX+azm9cuwuPlqVWGO8V1UFTQfMRLO8viWvR6IH8oQ5omwe2elT6bnGEiJUIW+rFA5kxeyp8u6Eaq0mGZSS3UINEMeV1SNoyDOhxDd4Vuzfsf6Skr3epyc4aXqZumnZolVw8pDFVLpwy2wq0Ycfcf9ID2792uXuUi9owpjxZEXI1Wsgo1OpYRCrUUt4N9kXqZ4rE107vmdqVCYYEWxpKK1COv/arE+XGBM/gAVOAi+zAt4ThggBz1AeQFcCgeuN0xQJm13ogXN19LQflO+GnCl+F1MZgz7COZuv/KnqKYlOXfiPmWpVS4pGQd99e/JC2O0R7yKHdmdnNodwbjyAxvkSYS2rWPG7XpEmKaQ7OjZG1n5y6lZG63oZJQ20hyQ2fAAn9fUT+phEXt6RiNhAc64VCF4bEqZj4XC8tdTDOCOvaJJmJE3ebUuPuTw+he1j02IXW986bI1Q
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(8676002)(8936002)(5660300002)(52536014)(41300700001)(2906002)(38070700005)(83380400001)(186003)(55016003)(122000001)(478600001)(54906003)(38100700002)(316002)(86362001)(6506007)(33656002)(7696005)(64756008)(71200400001)(66946007)(76116006)(66556008)(66446008)(66476007)(6916009)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2lySGVyOU45U2NIWGZFR2lWc3d6MnNFd0lPRUxmbUF3MnJ2ci9scTNVRDlT?=
 =?utf-8?B?c1RMTmJrZTk0b0dwbk1ERDl1SEgxaW1VZXphWkJOOWdabnF1cXY3a2FmYXlF?=
 =?utf-8?B?bnU0QWdyc0dkU09NS1dCaURkZkkwRGRzU0s3cmdmenpreUk1Q1VxcUFLNWNZ?=
 =?utf-8?B?VWREZFU1Uk1HOXJRZ1VsbkY4QzhiRGh4WEdUSStqZzBEUzYrTm9XRzQ3ekM2?=
 =?utf-8?B?bCtOc0N5Y05nWGxnZWdIVXJQeUtPM1VEeGVjc0R5T1FlSFdjSVJCeEovTitJ?=
 =?utf-8?B?VjY2N3h2OGxzeU9vWXNDNlkrTFg3S2R1aTdhOFlEMlQ3YmpHb01ZdTJYS21V?=
 =?utf-8?B?ZDgxQ1I5Ylhua05uRWdKRVRJL2cxZDJJdlMyN1ZLQXZ6bk1qUFhSMEZtTXVP?=
 =?utf-8?B?ZVNZZVNRakF0Z0crZXJDWDFuUFNGbzJhdlQvS0hXU0VCYWlYU2lMWnAyeTdn?=
 =?utf-8?B?MEorUS9nUjcyZG43WlRneElaQitGYVBuQXNpaEMwMXlXK25zZTFhVXdOelN1?=
 =?utf-8?B?RE9SRVFGNnljVndLRS9xbEFOd254UEh0UlRPVkpoR1ZyenBuS1JEUTNoNVdT?=
 =?utf-8?B?WVpnaTMwY3hDTU1nL0djeFlESFlzSW13blJnK2RuSVdsbUV2L2hpK3VGaHpr?=
 =?utf-8?B?NHZubTUra1ZPOHRBUmtSRW9QdEF6UEJhL2wrd0lWeEcvMkdQM0swL2k4S3d0?=
 =?utf-8?B?bDZIWkdtRUsvcDVrdnZJdy9wUWdxRmxFOU1kWnNiclJYUmwwaURzTW1uUU1x?=
 =?utf-8?B?aFhLZFFBeEtIWGtZTGFlR1lzQUxDN01sUDZSdEljVEFkYU5BdzVvS1VORTRv?=
 =?utf-8?B?N1FCSG9TdTBad2xtaFBKMTN5eGFUR296eUdCeWNtazZDeTJOREFmT04yQVlC?=
 =?utf-8?B?a1NMQnFQamNHYm1VRUU2MXVsUjJrdzZ2bmRzbTl2SXhSdE5ubjRIRldZUkdP?=
 =?utf-8?B?U0VMRTVLSnpQaEIwVGRURDNkZmVTcEt5ZWIwRUpzek4yT1pFM21aci9abjBt?=
 =?utf-8?B?ZU1aVXR4dEVLYXZVQlFWdm5kMCtUOHZkOHdkUlNvRStPSjlqOGVQTmVMd2xv?=
 =?utf-8?B?ck81Z05DVWNia2F1YTNqNUljOVNnSlZzZTQ1WnI5SlU3KzZ0QjUvVUVQZU4w?=
 =?utf-8?B?NkxVemNra0EvSmMxdHZFRmx4bHhOZlRDVXRhbmRWYkJyMW1WSXEyWmNtOVZM?=
 =?utf-8?B?cWI3UThSaUExSU13Z3JEVDhCelF1ZUtWWXRnT1ZHMHh2ajVSRk5Pd3UwcDVG?=
 =?utf-8?B?Y09UTWhzSjIxTmdHSHV4cTJ0RDBhY2MwR2U2dnEySXRVWk5QcEVIUncxSnRY?=
 =?utf-8?B?aHRjWHZZdzNZNFJDYmZWbXRQUzRKQldFWjFCNkpUSkk1Z1FOL2svQWJBaXBO?=
 =?utf-8?B?TDNaSldMVTk0UWtiTWd6U1VyWUxqaElNd2FLS3Bva3RibkdFSkY4OXZHSkU0?=
 =?utf-8?B?WUZESklJSWcxK3UvbldzcndNUzR1d0RTa3VLSnJUV2x5aGJ6dmdmM0JQTmhy?=
 =?utf-8?B?Y1RKKzM5NUtzQzlMR2ZBeDJ3ZFNVTTZBdnFYWGh3ZlZMVDA2OU1oKzZKcEpO?=
 =?utf-8?B?Umk0SlBHSFVRMVpoWG93VkxrckQrUHZHeGZ2aEZNdnNscXlIcWNmRXYwYXpD?=
 =?utf-8?B?clY1ei8rRXRHTjZSb1l6UGk1MWJ3R1QvT1NnMTRSMmpJN1ZRRzVQMFM4MSs5?=
 =?utf-8?B?SVlEczRxZStmTml6SGwzVldRYXk3QkxFM2F4azZ3aUlVU2hBd1ZNYnZKYmFU?=
 =?utf-8?B?WkY2RjBVNnZhMGY0QWxrZm1WLzNQRjgrSzVsMm85dG5rV1BGcitlS2o2YkNO?=
 =?utf-8?B?QmxpRUI3Ym9JMExORXlwTkNxT1VvQkovRmJ3MCtLakhTYlFBdzNxU3hLa1lh?=
 =?utf-8?B?V0kyK245dkxVYmNaWkVUcDIvZkJjNVVhVmc5YytscGtqSkV0Q0FGOU51eVFL?=
 =?utf-8?B?aDhYdkRKZ3paLzY1dVNUV1ppUzA3ckR4OWZqL3dncEoyeFZJVmNCV1dGVVZh?=
 =?utf-8?B?WnBham1uUnRYOU5mc0Z2RFV0QmV4bHdrblczWkhFdVp0NTArWUtZRzVkWHVM?=
 =?utf-8?B?Y1BRT3cyK0NpOHpFVkpFRGQxeTNnQU8rb3RESElLSUVFT3lweU54cEVOVGlk?=
 =?utf-8?B?MUZaY3JlY3d0UW5kNktocFA4RXUxZmRDa0VSKzJFck5XdGRpMm5tcm9oQkY4?=
 =?utf-8?Q?CvoJ3h3XbMfh4T7ctp0YqTuInXVFUzAdgvatfmsabhYD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b2536e-2166-473b-e442-08db934eca98
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 11:51:21.8561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYFFbgKH/ccaVNKaIlD6RmVu6hm9/4Yn9lW8LfEFGPOUVFJOoBAt4uWyy8GV1mgjyAXVkN7DiBYCoGVd7Jc5YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
Subject: [virtio-comment] RE: proposal: use admin command (and aq) of the device to query
 config space

DQoNCj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBBdWd1c3QgMiwgMjAyMyA1OjA1IFBNDQoNCj4gPiBJIHNhaWQgdGhlIG9wcG9z
aXRlIGFib3ZlLCBnZXQgYW5kIHNldCBpcyBJTkJBTkQgZnJvbSBndWVzdCBkcml2ZXIgdG8gZGV2
aWNlDQo+IGZvciBQRiwgVkYgYW5kIFNJT1YgdGhyb3VnaCBpdHMgb3duIGRlbGVnYXRlZCByZXNv
dXJjZS4NCj4gPiBUaGVyZSBpcyBubyBBUSBtZWRpYXRpb24gZnJvbSBob3N0Lg0KPiA+IEhlbmNl
LCB0aGVyZSBpcyBubyByaXNrLg0KPiANCj4gSSB0aGluayB0aGVyZSBhcmUgZGlmZmVyZW50IHJl
cXVpcmVtZW50cyBmcm9tIGRpZmZlcmVudCBwZW9wbGUuICANClllcy4NClRoZXJlIGFyZSB0d28g
cmVxdWlyZW1lbnRzLg0KMS4gQnVpbGQgU0lPViBkZXZpY2UgdGhhdCBjYW4gbGl2ZSBpbiBoeXBl
cnZpc29yIGZvciBoYXZpbmcgMS54IGJhc2VkIFBDSSBkZXZpY2UgaW4gZ3Vlc3QNCg0KMi4gQnVp
bGQgU0lPViBkZXZpY2UgZ3JvdW5kIHVwIHRoYXQgZG9lcyBub3QgbmVlZCB0byBoYXZlIGV4aXN0
aW5nIGxpbWl0YXRpb25zIG9mIDEueC4NCg0KVGhlIHRyYW5zcG9ydCBWUSBwcm9wb3NhbCA0IHBh
dGNoZXMgaGFkIGhlYXZ5IGluY2xpbmF0aW9uIGZvciAjMSB3aXRob3V0IG1lbnRpb25pbmcgdGhl
IHJlYWwgb2JqZWN0aXZlIGluIHRoZSBjb3ZlciBsZXR0ZXIuDQpJIHdhcyBwcm9wb3NpbmcgdGhh
dCB3aGVuIHZpcnRpbyBidWlsZHMgU0lPViBkZXZpY2UgaXQgc2hvdWxkIHN0YXJ0IHdpdGggIzIu
DQpCZWNhdXNlICMxIGlzIHNvcnQgb2YgaGFuZGxlZCB3aXRoIHNyLWlvdiBvciB2ZHBhIGFscmVh
ZHkuDQoNCiMyIGlzIG1vcmUgY3JpdGljYWwgdG8gZ2V0IGl0IHJpZ2h0LCBhZnRlciBTSU9WIFIy
IHNwZWMgaXMgZGVmaW5lZC4NCg0KDQo+IEZvciBleGFtcGxlLA0KPiBjb25zaWRlciBjb21wYXRp
YmlsaXR5LiBJIGtub3cgaXQgbG9va3MgbGlrZSBzdXBlciBpbXBvcnRhbnQgcmlnaHQgbm93LCBh
bmQgd2UNCj4gc2hvdWxkIG1ha2UgaXQgcG9zc2libGUsIGJ1dCBpdCdzIGp1c3QgbGlrZSB3aXRo
IGxlZ2FjeSBpbnRlcmZhY2UgLSBsb29rZWQgdmVyeSBmYXINCj4gYXdheSB3aGVuIHdlIGludHJv
ZHVjZWQgbm9uLXRyYW5zaXRpb25hbCwgdG8gdGhlIHBvaW50IHdoZXJlIGFuIG9wdGlvbiBpbg0K
PiBsaW51eCB0byBkaXNhYmxlIGxlZ2FjeSB0YWxrcyBhYm91dCAiZmx5aW5nIGNhcnMiLCBidXQg
dGhlIGZseWluZyBjYXJzIGFyZSBub3doZXJlDQo+IHRvIGJlIHNlZW4gYW5kLCB3aGlsZSB3ZSBh
cmUgbm90IHdoZXJlIGV2ZXJ5b25lIGNhbiBqdXN0IGRyb3AgcHJlLTEuMCBiaXRzLCBhDQo+IGJ1
bmNoIG9mIHBlb3BsZSBhcmUgdXNpbmcgZS5nLiB2ZHBhIHdpdGhvdXQgYW55IGxlZ2FjeSwgZXhw
cmVzcyBkZXZpY2VzIGluDQo+IHFlbXUgYWxzbyBkaXNhYmxlZCBsZWdhY3ksIGFuZCBzbyBvbi4N
Cj4gDQo+IA0KPiAtLQ0KPiBNU1QNCg0K

