Return-Path: <virtio-comment-return-6060-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B5C77B73
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 00:33:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61D372A881
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 00:33:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A191986610
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 00:33:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3473A98646D; Thu,  1 Jun 2023 00:33:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1ACE4986604;
	Thu,  1 Jun 2023 00:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8UFfuTETOR6OIgeakzDx6nt1rRda1KJBUZsBRA1FGbjRMkFH3SH7/jhm+OxWgWzb9tWbCc0CQJ2XRgqDq8hjW7uUvvblu140jq0giTJRNM0vG5gyx5mn1mfOxRrY+Qmi/DGnbWOWW8gTI/0ZiL/CIP29udfo5WAjdaXAa+YyaTFJWRHhm9CBPUBpmORYdv28U/X+Uuh53ly70dMnQVVN0KhdB9m+FedwZn15FM0DzRUJEFdSKbI15t2CZzfVbLLkltmrvq2pBvsMDg4Uz6ExYhZ9Bxj+TCpB3uqJgZSTWZzdaZwGFdq8S7EbAiaROZOTHOVKT565V0UO2r6dvjF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgkpGdMUamElAsNADXkBJFaRI7sxk5Jsr4vQRYTBZLU=;
 b=SM+/PHVDfMBmE1Iy/PkreBCTzbQ75XhE4nN0Ks6NFhJaG7xsJdkGTPq0x7gJcA/wn0dY0KJH5P464+B+6FnkLmHdbBpQtu95TZcfqh7srlDretGw9xZDMoc8NeOLTjGrZ+A9U0xRYthbPTI2Ktpw3GW/qjb6C9AQCEIRtuQCHVT8oPEUncuGl9gW1qr4beGUGeB+lDh9tO+4RWWj04X4XuUD1OZasQ9dofEbrkAa6NYZTfs09qwjBWsVHtjcg6yygTrXBju/HbL8877MvUDHEBKRPyzrZSndhBKWb99QJTG0A3BnyP9avgeni202Q0bs22p1p0y4g5cd9rAgDRQ6SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [virtio-comment] virtio networking collaboration meeting: call
 for agenda
Thread-Index: AdmJCcjCjRUFdJrUSz6FqEiskKvSlQLBKLYAAASG6KA=
Date: Thu, 1 Jun 2023 00:33:43 +0000
Message-ID:
 <PH0PR12MB54811BFA23452BEA3313DBCADC499@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b2e85349-35e2-23ed-46c9-20f0cf47760f@oracle.com>
In-Reply-To: <b2e85349-35e2-23ed-46c9-20f0cf47760f@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8754:EE_
x-ms-office365-filtering-correlation-id: 4b29b02b-543c-4177-d1b8-08db6237da81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jem6bPdONhu85voRmPNC0CTN6c52Ww7ZJdUatcI7oVHWyFsZkx1DfUW06E9f6wR+Zz1/UxCupVLBFrlgx4kPuepXs6E6K5eSBtcWWAmbaN2Uq0uJJEKTqrXE5SfCS7FmROXT99fovqMwAhc3Mz0kGpG7c2plDmVUkV2OQgUwrOUVSxc8tOQXuVdfbFqCqKujCSfmhxprY+1PymddPCyJR7jTxy+8U48SuAK2Z8xvQ7CjvflTRXD+T9atghqeztYFgG1p5GQ4rtQSyIpOaMefcqPx1m5/rpD+dBfkpJSC+Fego6iHODtj/oPEIeE05EfxFjngDLNeuCnBw5FFKWRLX2/YngTwp/B7cy9EbkWh6fMKBVtHqzbws8OciL942pO6KlWqMlxqCWgp1kk8x11DavGfHxmWuds/wlpZ1hTxAfZXZrZLO98gd4boFzftD6EIPkpHkaGsgMroN7QeRqCghuN1Leses4Gf3J3F5JDrRLaRbDarMNgTKv3YeKi4A00mKWdWTAwYTt9g0sIslWziigSiPMrnW/PGkJOel5ZbQM2KIXi6YNY1EXF25DQ/TIegO2pgEoONeXPMRoON9NwfhuzxgFjoFMvjcNJcOZaDBP4qqGfuv62efyVZpqCL2Ef5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(110136005)(64756008)(66946007)(76116006)(66446008)(66476007)(66556008)(38070700005)(4326008)(316002)(478600001)(86362001)(33656002)(6506007)(186003)(9686003)(8936002)(52536014)(8676002)(2906002)(5660300002)(4744005)(7696005)(71200400001)(55016003)(122000001)(38100700002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1ZqT292bDBhVVZuVlEySXdZdEdydTQrWXREclZLeUNUOXdVRFdpN0wxTHRv?=
 =?utf-8?B?UHhrUWs3eENTS25sbUoyNWRQdWc2dTVFN3dqaWtCNXNQN0tjWndkeDViSGtx?=
 =?utf-8?B?Vmp0eEhvWG5OZ0ZQRlVoT3hES2pzM3dTM2ZRbjkwdFp3TnpVbWhnamVsbkZF?=
 =?utf-8?B?SWcvbllkZzVDY2Z4cTZzRDVLNGlPdWFCaGhVTXJmNmJkc1ZwWkIwMWY3NEdT?=
 =?utf-8?B?UUlXcEN0SzZVQW1zaXR0Y0x1NStscncycFhPQXZPQ2tuaHFpMEVXM1ZNZk5h?=
 =?utf-8?B?SVNXTnFSUmtyUnVNN2cwWndUQ1FpTitINFVIS0NrRUthSDZJQU5XR3djUDNV?=
 =?utf-8?B?R2g4RzVnckdHVlRTVTlscXg3UDYrMmxPcWgwbnJOZzNUNWVkMXhRM2NmaDZn?=
 =?utf-8?B?M0REcXMvSXMrVTRnY3ZCMUptTGIyaHVHaUc2RmtkdFhNbFJTZHpKTmZyZnBX?=
 =?utf-8?B?ZmpBK2RuM2pPMXZqc09aU1JWNFVnN200SUVIT1ZCOTFDS1hLNG81Z0ZKVml2?=
 =?utf-8?B?aHZKVXFsT2xGeHF2eFBIa2diRTBMQktEcnpGL2QzSVFoVXBqSHJub3FDUUt3?=
 =?utf-8?B?T2tIaDJ2KzVzcG1NbVc0S005RGtoZDZVcU5oMnd2MFI3K3hWVXRjaVBTNmwy?=
 =?utf-8?B?aEw3cjZBcUdlSng0TENGVlArb2JPUCtYL0F3RngyVWFUMkJybEhDaUdsVU5U?=
 =?utf-8?B?elh6ek5FY3FBRHF6SjVjSWpUYnZDVDE1ZlM5emJDNElPWVZnYjlGZ3dYa3hL?=
 =?utf-8?B?N1krWk04dU5NZVNKdGNpZG9Uay9aa29pY2s4TFNSNHgwSGUwcldKbk5KOTYz?=
 =?utf-8?B?VnhpQVlRTE85OXlTZFBROEJvdXFXMXBBVHcyaDA5NHFlc1BCSktvRjhNSjU1?=
 =?utf-8?B?L1VBcnhxU2hPSktVRlNQSHVadS9EcWg5UWltbTIvSiszRHhlRnFFZnd2ZWVz?=
 =?utf-8?B?TGZURHhVUXdTWlV1WngrL0lZeUdoUnpJVUR4OVd3TzU0dWVVVk9lOUxMM01u?=
 =?utf-8?B?ejBoMzE0dXRnOHhNSE9qMDEyYVU4UmVlS0xZaEp1YzNZNEpsMCszS3F5SjZO?=
 =?utf-8?B?WHJnNXMydjR1QmdJbGY0Sm9qb240dzB1RUFITUtnS2o4cmlkczVBd3Vhamhj?=
 =?utf-8?B?eEZrY0M0MldlQ3Fvb0grZmpZQkdTMWEranh0cEpWOU41YjdqRXk3NDlueE9C?=
 =?utf-8?B?bndVZ3Nkc0Npd3djdHhVWSt2emlzVDRzcGlxak5HSTNkTmwvazlHczJ1SENR?=
 =?utf-8?B?K1JRNE1Rb2NzOHVZdWhjVHcvWmUrTndOVUhSWlE3NXBjSVRLbTA5WmxXM0hB?=
 =?utf-8?B?TERyR21vZUp2T1RDNjZ4YU9wS0JDUC9wUmNROEhxNUVIZWpzYkozdERXc1hu?=
 =?utf-8?B?bitjc0NoZi9kRE1PQzVsZ2hxYm5UaGgrZlhVaThTUzJlaGIyTWpoVDR6RFMr?=
 =?utf-8?B?NlJPSUh6anoyWnpieGNtUGFPUE51K3NxRmhRWlMvRWtyOEZ6azBPSGhwbEJF?=
 =?utf-8?B?Um9XSlFDc1RXNWxNMWdZUmxjSXEwOXl3Q0RvRTA1eGhMY3dMMGZ4MnlRdUhY?=
 =?utf-8?B?M0Fyb0xMeUllcWgzZ2M3N0k1MjZpMDRSRnJDSFNxeW9zWkUrUXh5K2tKTjJD?=
 =?utf-8?B?MFRCU25kRTEwOGtKaUs5Vm0vbHJ2Q20xZis1UU1WSndDQzFyVi9DVTg3Q2M2?=
 =?utf-8?B?RXVTdHljTWZyeUVtKzFnK1UwQ2g5bjdiMi9Jb2VsNm1uS0dGejBCdHR0bmw3?=
 =?utf-8?B?eGcrRlhDaFUzbC92ZHBrU0NHaDR2Z3J4R3pkODRzWnJFZ013WHU1Nlh5KzZV?=
 =?utf-8?B?U3dYNllYZUJ4MjlrNGF6QVAvQzZ1WCtjbEluaEVPVEtTcmY4eHUwRm5CdzNZ?=
 =?utf-8?B?YTBHNUR2THRqaEdrMlRIWjNpbDI0ai93Y0o2Zy9hU0ZtTmY5U0R6NExtQWR0?=
 =?utf-8?B?Qjl2TFBHUlJxa29rTzlqZUlLdENGS3l6cmZpZXptdzRsbTRWMVBXM0xNMkl2?=
 =?utf-8?B?cW0rdXZFL2w4Y0VxZVUzby9WU2h1TFd3aWFsSy8za0lEejBGSHZMczBmbUlH?=
 =?utf-8?B?WkFWaVltV0lDRmRtWVBVZlZGVlVqdjZhN2N0c04rM2JadG96djZFUlJqeUMv?=
 =?utf-8?B?REN0ZG5LTDRGN25VL2U2UE5OS2d6eHF3UkhmZmhCSFFlVlo4U0hkR1hzZlB0?=
 =?utf-8?Q?0JBWsJ53wdqyHHJa9v+InHs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b29b02b-543c-4177-d1b8-08db6237da81
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 00:33:43.1604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pc8leO6oN+p+ebfeMjF5MNAVaSzC6GR7Swpp72Me0jS48sFQqWjJUY4WRFFN3vCBWrtOJJ6bxAD/sCu9vCbQng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
Subject: RE: [virtio-comment] virtio networking collaboration meeting: call
 for agenda

DQoNCj4gRnJvbTogU2ktV2VpIExpdSA8c2ktd2VpLmxpdUBvcmFjbGUuY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIE1heSAzMSwgMjAyMyA2OjIzIFBNDQoNCj4gPiBJIHN1Z2dlc3Qgc2V2ZXJhbCBk
YXkgJiB0aW1lIHNsb3RzLg0KPiA+IERheXM6DQo+ID4gLSBUdWUgKE1heSAzMCkgb3INCj4gPiAt
IFdlZCAoTWF5IDMxKQ0KPiA+IFRpbWU6DQo+ID4gLSAyIHBtIEdNVCwgb3INCj4gPiAtIDUgYW0g
R01UDQo+ID4NCj4gPiBXZSBjYW4gcGljayBvdGhlciB0aW1lL2RheSBvcHRpb25zIGFzIHdlbGwg
ZGVwZW5kaW5nIG9uIHdobyB3YW50cyB0bw0KPiBhdHRlbmQgYW5kIGluIHdoaWNoIHRpbWUgem9u
ZS4NCj4gNSBhbSBHTVQgV2VkbmVzZGF5IHdvcmtzIGZvciBtZS4gSWYgcG9zc2libGUsIEkgd291
bGQgbGlrZSB0byBhdm9pZCBzY2hlZHVsaW5nDQo+IGl0IHRvIHRoZSBzYW1lIHdlZWsgb2YgdGhl
IHZkcGEgbWVldGluZywgYXMgSSBoYXZlIHRvIGF0dGVuZCBib3RoLg0KDQpPay4gU291bmRzIGdv
b2QuDQpXaWxsIGNvbGxlY3Qgc29tZSBtb3JlIGZlZWRiYWNrIHRoaXMgd2VlayBhbmQgaWYgdGhp
cyB3b3Jrcywgd2lsbCBzY2hlZHVsZSAxc3QgYW5kIDNyZCB3ZWVrIFdlZC4NCg==

